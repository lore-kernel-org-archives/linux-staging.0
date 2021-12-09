Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7248429CA
	for <linux-staging@lists.linux.dev>; Thu,  9 Dec 2021 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kqZSk
	lQA1YQdgIqtyvEUJWbCO731cy5VG7rlJsg//qk=; b=CFPve/AzKi4tA87NIa9+d
	QN41jum2+A+a5FO+mmXRYcmm1fGUVr5bIUjWEmHdP7t2osOiaVF7JmC36QZs07VK
	REbt3UPjTgkbLwGEJaLhmGLJi50ULTLBhEhshAiS6+t7RgD6LYthVHy4KJLq8y1E
	bVy3WNKFHsmxDzVfhD7Pc0=
Received: from localhost.localdomain (unknown [218.106.182.227])
	by smtp2 (Coremail) with SMTP id GtxpCgBHYT2_A7JhoRISMQ--.43569S4;
	Thu, 09 Dec 2021 21:25:31 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	martin@kaiser.cx
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jianglei Nie <niejianglei2021@163.com>
Subject: [PATCH] staging: r8188eu: fix a memory leak in rtw_mp_pwrtrk()
Date: Thu,  9 Dec 2021 21:25:15 +0800
Message-Id: <20211209132516.8387-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GtxpCgBHYT2_A7JhoRISMQ--.43569S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArW3tw48Cw4fJFyUGry3urg_yoW8uF1fpa
	yfAry8CrW0qw18GFWv9w1UWrWY9w40vFWFgas5CayfuryrurWSvFykCryjkryDAryxJF45
	CF4UtFWUZw1qkrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDo7tUUUUU=
X-Originating-IP: [218.106.182.227]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/xtbB3RBkjGBHLV9xAwAAsC

Line 5968 (#1) allocates a memory chunk for input by kmalloc().
Line 5973 (#2), line 5989 (#4) and line 5994 (#5) free the input
before the function returns while line 5986 (#3) forget to free it,
which will lead to a memory leak. This bug influences all stable
versions from 5.15.1 to 5.15.7.

We should kfree() input in line 5986 (#3).

5960 static int rtw_mp_pwrtrk(struct net_device *dev,
5961 			struct iw_request_info *info,
5962 			struct iw_point *wrqu, char *extra)
5963 {
5968 	char	*input = kmalloc(wrqu->length, GFP_KERNEL);
	// #1: kmalloc space
5970 	if (!input)
5971 		return -ENOMEM;
5972 	if (copy_from_user(input, wrqu->pointer, wrqu->length)) {
5973 		kfree(input); // #2: kfree space
5974 		return -EFAULT;
5975	}

5980	if (strncmp(input, "stop", 4) == 0) {
5981		enable = 0;
5982		sprintf(extra, "mp tx power tracking stop");
5983	} else if (sscanf(input, "ther =%d", &thermal)) {
5984		ret = Hal_SetThermalMeter(padapter, (u8)thermal);
5985		if (ret == _FAIL)
5986			return -EPERM; // #3: missing kfree
5987		sprintf(extra, "mp tx power tracking start,
			target value =%d ok ", thermal);
5988	} else {
5989		kfree(input); // #4: kfree space
5990		return -EINVAL;
5991	}

5994	kfree(input); // #5: kfree space

6000	return 0;
6001 }

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 0eccce57c63a..906a57eae1af 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -5982,8 +5982,10 @@ static int rtw_mp_pwrtrk(struct net_device *dev,
 			sprintf(extra, "mp tx power tracking stop");
 		} else if (sscanf(input, "ther =%d", &thermal)) {
 				ret = Hal_SetThermalMeter(padapter, (u8)thermal);
-				if (ret == _FAIL)
+				if (ret == _FAIL) {
+					kfree(input);
 					return -EPERM;
+				}
 				sprintf(extra, "mp tx power tracking start, target value =%d ok ", thermal);
 		} else {
 			kfree(input);
-- 
2.25.1

