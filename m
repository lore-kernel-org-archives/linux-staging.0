Received: from pku.edu.cn (mx18.pku.edu.cn [162.105.129.181])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE72172
	for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 03:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=ZAl6ksmcPO
	w5PM3ub/L5jS2jcAzxG4oQSEuNQrxQs+Q=; b=qp1gZfcQKHghYUKmQD2ofr3QrD
	/5HnFsUKM0NMlD/NEkUumauY5+VyRhQmlnCVoT0tbKJ3MjQPrCfc3zeFArqDdfyn
	yPZG8QC5670ZVjTjifQV9CxAQKr28tLMh7VvZ3z2TkXDsdFNMFKLxVeI/YdsGO9Z
	38JtrxoT+loE3RvHo=
Received: from junqi-virtual-machine (unknown [10.2.70.49])
	by front01 (Coremail) with SMTP id 5oFpogAHDo7LypVh9M9KAw--.10041S2;
	Thu, 18 Nov 2021 11:38:51 +0800 (CST)
From: Liu Junqi <liujunqi@pku.edu.cn>
To: gregkh@linuxfoundation.org
Cc: david.kershner@unisys.com,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	Liu Junqi <liujunqi@pku.edu.cn>
Subject: [PATCH] staging: unisys: visorhba: use tab to indent instead of whitespace
Date: Thu, 18 Nov 2021 11:37:38 +0800
Message-Id: <20211118033737.576775-1-liujunqi@pku.edu.cn>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:5oFpogAHDo7LypVh9M9KAw--.10041S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF45Xw1rXrWkur1xuF1Utrb_yoWfGFX_Wr
	y7W3WIqryvyrW5Jr1fGry8Z3s2gFWvgw1fua4SgryfWFWDZ39xJrn5Cw13Jry5JF42kFy7
	ur1vvr18Kr13JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4UJVW0owA2z4x0Y4vEx4A2
	jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
	x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
	GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK
	82IY6x8ErcxFaVAv8VWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
	U==
X-CM-SenderInfo: arzqiiirtqlmo6sn3hxhgxhubq/1tbiAwECD1Py7tTfDgArsu

changed the whitespace to tab to comply with kernel coding style.

Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
---
 drivers/staging/unisys/visorhba/visorhba_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/unisys/visorhba/visorhba_main.c b/drivers/staging/unisys/visorhba/visorhba_main.c
index 694644112447..8eee131e834d 100644
--- a/drivers/staging/unisys/visorhba/visorhba_main.c
+++ b/drivers/staging/unisys/visorhba/visorhba_main.c
@@ -266,7 +266,7 @@ static int forward_taskmgmt_command(enum task_mgmt_types tasktype,
 					 &notifyevent, &notifyresult);
 	if (ret) {
 		dev_dbg(&scsidev->sdev_gendev,
-		        "visorhba: setup_scsitaskmgmt_handles returned %d\n", ret);
+			"visorhba: setup_scsitaskmgmt_handles returned %d\n", ret);
 		return FAILED;
 	}
 
-- 
2.32.0

