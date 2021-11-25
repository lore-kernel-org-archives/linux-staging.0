Received: from pku.edu.cn (mx19.pku.edu.cn [162.105.129.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5242D2C8B
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 04:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=ZAl6ksmcPO
	w5PM3ub/L5jS2jcAzxG4oQSEuNQrxQs+Q=; b=aE1+agDrHWu5KyyZuoePWR5NzW
	d9AHU8PN1YYUvUo4YPYMGo28yl7yRe6FRGXAfj8c4p0+Jaxf+GhDNlCttA8a9BYT
	hPWqc9gpqLScDFAHy02m9PK2muG5jXYxpkZCSJR/rbVobVOZ63evPt6OXwqCHarW
	RlXFeSxmlTZjAzf+A=
Received: from junqi-virtual-machine (unknown [10.0.164.11])
	by front02 (Coremail) with SMTP id 54FpogBnbU09Cp9hcFykAw--.20730S2;
	Thu, 25 Nov 2021 11:59:57 +0800 (CST)
From: Liu Junqi <liujunqi@pku.edu.cn>
To: gregkh@linuxfoundation.org
Cc: david.kershner@unisys.com,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	Liu Junqi <liujunqi@pku.edu.cn>
Subject: [PATCH V1 RESEND] staging: unisys: visorhba: use tab to indent instead of whitespace
Date: Thu, 25 Nov 2021 11:58:44 +0800
Message-Id: <20211125035843.589496-1-liujunqi@pku.edu.cn>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:54FpogBnbU09Cp9hcFykAw--.20730S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF45Xw1rXrWkur1xuF1Utrb_yoWfGFX_Wr
	y7W3WIqryvyrW5Jr1fGry8Z3s2gFWvgw1fua4SgryfWFWDZ39xJrn5Cw13Jry5JF42kFy7
	ur1vvr18Kr13JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
	UU=
X-CM-SenderInfo: arzqiiirtqlmo6sn3hxhgxhubq/1tbiAwEPD1Py7tbyVAACs-

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

