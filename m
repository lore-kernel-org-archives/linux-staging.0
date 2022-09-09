Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17943808
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1662723898;
	bh=GoDc4LZlJnk7BKRtfd9hVVratjVC2ckCT/WzQREHcHY=;
	h=From:To:Cc:Subject:Date;
	b=pboYgT5Jbvbmk0G24L8ywsObjDjSFpxlHT/b6Wx+WKsS4E8/3V+/PRAIGkc9NU/8v
	 6xk4rk3KIUDO0jJc+W4yHyYDEyFblhHnW3G/wxasSxNKj9KdKTVTTitM9LXRuXaGSc
	 vQ5v3iPywwv/Fs73iIQKe6D7+dJvHMtWbZm008NQ=
Received: from localhost.localdomain ([59.172.176.188])
	by newxmesmtplogicsvrsza31.qq.com (NewEsmtp) with SMTP
	id B3787C40; Fri, 09 Sep 2022 19:44:55 +0800
X-QQ-mid: xmsmtpt1662723895tzg3wm8ef
Message-ID: <tencent_7705902B66DA5C1C0E3E8ACBF077A5C3FF07@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjqAeriiD9KExAWTFIKtt8eubJi0N6BlEZJaIoAvSYJcwkhzLEk0
	 8pH6bQmckHLiGHejmEUMdbXhCCnBX4zJJB9vRS0VIdWWmKugLj9rFrDOBHbyE18oT51xPFTZtg0s
	 e0/yd7eEItJnxCbH6smbWTWdmeFO2FRNIye96y5ixbHFTnrQjioGAW9V+3VFAqmO50tc5FdTlDwg
	 YMSd7jZAvu59a6kWos7P+CjkiGhT2WjGuHfQiOOQ+LeUBwgN6E4Mga6g+0csLOepTpQslfryC9a9
	 MoW+RASQfAK1r9Kvyg1nC+5aSyb7z8HVs38u8uV9r4F7LrhV9+V4C+NT4K9N1cBt7qDO9mIOgCT3
	 cwzyYSevHUyIIzXIo15PkxZa5EKa5skWG/wpEKZfelcvrsj7VnJ/MX1CQ1+idpakqOp55akTZo/P
	 tCnVWOhtZomXL8HmLHApHqgHlgH2/VFmK9KLNvMYdziEvBx/6BgqUUN+0dWxNQN69LEXKnYpYS1Z
	 FgxVOyWX0hvgfmVBNY9XINZU2d1helRhMyXmQkiN6aAxkNc8qSAKQt/08rRn8AxIcNIh/MMcO9PZ
	 n+4iwXVJVPoa6Q9v9MJpcvj7IHZdSGKlu4UFumx3RNNn9oSlP6l1ceX4JSlGuWP2vQsdrD6b0UFN
	 FqtBmq/JqumuYeQG3Sqdr21DwZjqjsFqRveV8OPewmqj8St2YylYf3iiSPrAInc/g/XXJbAAp8uZ
	 FQWYgXrOx1LdcNbhUkHJ5/3C8/LRknoPbSJgZP/0Cy4eW/RBt6omUC5V1JPiLMkFSTSxSfqALI6T
	 QYUaPkpJlCx8dhTFzjMq3wjzirxujEn8+Hum9fbnKlvs8G6ykVaUkPXbP5QptD2H2lcvF7mQyyGi
	 Dg3e4CrpQNC7dsUrAU3fD56IWsmZsK5b4VFUqK6pD9i3jkvOaRbdPe9H0CyQyE4Xnm2s9m/mfNSj
	 ejw9PyKug47JLpWdb0SSXBx4Kj2zTvasdnqtZzhbY0wjnUhkwQvwZp8h9Lm+ISp49ihtJmuNaL66
	 oeKL8GDQ==
From: xkernel.wang@foxmail.com
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v4] staging: r8188eu: fix potential memory leak in rtw_os_xmit_resource_alloc()
Date: Fri,  9 Sep 2022 19:44:09 +0800
X-OQ-MSGID: <20220909114409.3656-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

In rtw_os_xmit_resource_alloc(), if usb_alloc_urb() fails, then the
memory `pxmitbuf_pallocated_buf` which is allocated by kzalloc() is not
properly released before returning.

So this patch add kfree() on the above error path to release it. As there
is no proper device to test with, no runtime testing was performed.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 update the description.
v2->v3 rebase.
v3->v4 update the description.
 drivers/staging/r8188eu/os_dep/xmit_linux.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 89a598a..f25099d 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -75,8 +75,10 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitb
 	pxmitbuf->dma_transfer_addr = 0;
 
 	pxmitbuf->pxmit_urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!pxmitbuf->pxmit_urb)
+	if (!pxmitbuf->pxmit_urb) {
+		kfree(pxmitbuf->pallocated_buf);
 		return _FAIL;
+	}
 
 	return _SUCCESS;
 }
-- 
