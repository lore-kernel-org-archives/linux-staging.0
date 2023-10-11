Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80225224E8
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bSEjFnlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1697039857; bh=89OlmbRayHHSfrsyjEa7HqkqRFU1scQ6RhC9xkDe2r0=;
	h=From:To:Cc:Subject:Date;
	b=bSEjFnlISGgBma4F2uWnUrPGapcfwD62V8PgIXMMK3lbF1O1ZIPkLMfzCF1XnTyAH
	 89zZa8SgBxFXhCn3a4vmsf1SHLDntEurEcV1F3yhtr7NMgycDA23cb2PHLLsu1FWtC
	 6PYW5Ta0KU5xhFFGc73q6OPC/cdFBrNY57LaYfwY=
Received: from pipishuo-VirtualBox.. ([123.115.145.13])
	by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
	id D5011E88; Wed, 11 Oct 2023 20:53:16 +0800
X-QQ-mid: xmsmtpt1697028796t0fh3maqj
Message-ID: <tencent_90918480328EADE29768BD24360687D70F0A@qq.com>
X-QQ-XMAILINFO: MYHr/eEimg+xF+1qemSQhHXzMIGpKyrKMnHfXMPyHMFq+Ppdc7HWvd1ish5aEk
	 guqy/mVZLN4jS5PQOHCQwByQoTMjcYMchN7MzRyZKPzNjx3irUxHCoMmEv7iHYDNX8hTS8OZpPRY
	 I2u0RBOjmDEkfWl95bGe1aHEF8+NTerZRdNHSHp/hg2tyvaPOEtKH6uqNp3d6cX4FhaMkLhyVlOR
	 I4uhi2OWvJPE0q0fVFgz7JZyht/lJPVeGF2yQES3WzrMSxqajXdxonTZBNh/VDByOyl8XelGFk4V
	 WS/yGnpvuvKPXqbmyG24OzkK6HOmKxaE6+Ek0HH3Eh4tB0/0MNHTS2CPInp0z3sdfMG8Gx2kzONR
	 ITXrnYm7wJgqMJcd65qXwq6jgcvodg/bYJ/bZMxtmA+NVVSkS6DErvGCLdpcMvanMoG4LA1ruES5
	 e8WUjCvtTuqcwD7B86U7rrdNZnm63QLuf1P4eQXwPYgJuPWbyFUy3pN9cQvT9MRUvBNF7h2BFiNV
	 SklV8usq1AWkQUUhO72xxFP1xm2/namjFqSqPDOohK54wfXDM4ZubNqNMIq4BhaKFaZdllM8Mdjo
	 Cs0kg2ScydjIpLxgMQ0beXGVw7UIb2ztAPezNhiM3JWjWSjdY406tpQkoSSL9hoIJ27pwuastavQ
	 5Tx7CTuIj8M2tqwCaETO8WJvYXQpRweeZaT+a/DJM/2XUqJC53u+JNXgsTkqXIvWOEGJh4rPGcdG
	 UanESh6KyXZOgJ0eb9WE07VYXHfJqGU3/B/NttzuaRfJW9ksDfbVUw23oiMU3Faz8DVrHQ9HVuiO
	 R7a89XNvB4zJcpFPJ7cIoAMjkxG+dt685F17tBclAInjMeK2TOgSgOE7Gb/Ae10XZdIRrp/i6nO/
	 Qq50JbmYd61dfEHJvJIzOEy8HH4CGFG47xYgvdLzeh6lya40RtH32cEJGVtOWycokqyS2n423SSK
	 8OwztH6s2TGXiP2HwjPVuggG5GPe1lmy/r+ifPaDh6Qhl/VQLgmPdF1oZB1CFlme4LPsD0tZolbm
	 mGQwnHXdHJSLuNz/VO8sv4B56uez+itbmOFt5QGQszVCXMzIdPfm3xgvhRhhAoblCym1jUMXIRKD
	 hP/9h9GVTEyEBLDy+9UZzj3VooeA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Chen Shuo <1289151713@qq.com>
To: linux-staging@lists.linux.dev
Cc: Chen Shuo <1289151713@qq.com>
Subject: [PATCH] tty: gdm724x : fixes missing a blank line after declarations
Date: Wed, 11 Oct 2023 20:53:16 +0800
X-OQ-MSGID: <20231011125316.5030-1-1289151713@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the checks reported by checkpatch.pl
for missing a blank line after declarations

Signed-off-by: Chen Shuo <1289151713@qq.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..15c246d3b1a3 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
-- 
2.34.1

