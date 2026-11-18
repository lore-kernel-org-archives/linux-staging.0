Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002388;
	b=uYT1ZwLjahR3IxY1vZ0ukd4CxqCBB8jRbYwOqe7etJJXdugVJ/f7VoFfFlvutVpKSJQ0
	 nxhmEF+GgLPNbLBP0LJvS5xtWDcSaJQV4ZJ6ZJuVO6k+7scnWeaN+6/nVyhtUGEU++ZLQ
	 rlrVp7hVbdQd9nYjwOIf3yaO/h0G+/aFwcQek/J/h+jia2id1gcyJkugL2KanwK8JUlkK
	 j4zFpPKVqDMhIQiIlElvWp7U+kNLHApyTjJ7cw4o9WVv0QotK9tDVwSQ446vrknIpvRXF
	 xmIZBgGjJrp/ahxlpbTxx6rqsv+MCDvaI5F45K7sm2oGNkuldqyZeWtu89kzL7YVYEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002388;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nm1MpgKfwCOo+OO+1uPGVTYdaRxcqscqWt1Og//oUcA=;
	b=s5KWBDT7c2sNRsT+G3wazm7qMJj++HixKe0CVw9RWMsFGd7FhYvJtY9XEsfKWX/XkZDj
	 pgDV0+PADC7UTPek3LzJb4i/Uyss5hDvbg9n624ZQAl4R3DRF5ieYfXnSDpKqHMVnsGPs
	 fY9drYjmS86iFQQp65bANhW2PD+2hOuZlsv/JpbLlVNEvgA+7h0dmiqW3lt7g9wcoFiSf
	 5HFr1uWZ197sEezueMmJDbNqixYm41bkWzb7hldsSiuTYB2xUA9PNWPsG8cG605gBWfYI
	 IiQAZrFnJ+pJYhqIhC3aZO87acWFcDfztDr3MiEZNZiPdkko7GIGuNJPXBW2MOr5pKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=JE6XqfuD;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D81606A320
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 11:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D81606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=JE6XqfuD
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 706F026BE6;
	Wed, 18 Nov 2026 16:46:25 +0500 (+05)
Received: from laptop-ak.home (unknown [5.189.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 750F126BC1;
	Wed, 18 Nov 2026 16:46:17 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru 750F126BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1795002379; bh=Nm1MpgKfwCOo+OO+1uPGVTYdaRxcqscqWt1Og//oUcA=;
	h=From:To:Cc:Subject:Date;
	b=JE6XqfuDLf83PqUXyYT++D9HWj3WvAiFud8r5ErMY81P8REyXZKYeibwxsHeJ0bM3
	 uITJ6W9r+vuStmzwEojHJ7c7PMzgqks6y+JzDOhLmkDNXs2vMF4niECUe5mBYjALXw
	 BI6O7501Yt+j6kfrk6ocoKrMuLxX0tQ06XDdphb2sBfAfX4EgVtjE4aFDTg/QmRmMl
	 WLQkU/We4fLpebQoWAPi1bs1Td1Wi/oUKVxDCyC9cYYlFaxLNpuypQxS2QOuYoeUJV
	 dyTZN1UNqIZz3D1SQpata6ylK1chNwZFZRLbag0QUhvoGCiopVeYhoGyHekNTTOOGn
	 VxXLIQkSE+JrQ==
From: Andrey Karelin <a.karelin@ideco.ru>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH RESEND] media: atomisp: check load_copy_binary() result in load_advanced_binaries()
Date: Wed, 18 Nov 2026 16:46:00 +0500
Message-ID: <20261118114605.203316-1-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

load_advanced_binaries() ignores the return value of load_copy_binary(),
unlike all other callers of this function. If no suitable ISP copy
binary is found, the error is lost, the copy binary stays unloaded and
the capture pipeline is created without the copy stage although it is
required (always on ISP2400, for direct sensor input on ISP2401).

Propagate the error to the caller as the other binary loading steps in
this function already do.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
Resending the patch unchanged, only rebased onto current mainline. The
original posting got no response, probably because it went out
during the v7.4 merge window:
https://lore.kernel.org/all/20261020151247.441124-1-a.karelin@ideco.ru/

 drivers/staging/media/atomisp/pci/sh_css.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4a182dc384ca..3f3671ceca59 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5459,9 +5459,9 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 		need_isp_copy = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
 
 	if (need_isp_copy)
-		load_copy_binary(pipe,
-				 &pipe->pipe_settings.capture.copy_binary,
-				 &pipe->pipe_settings.capture.pre_isp_binary);
+		err = load_copy_binary(pipe,
+				       &pipe->pipe_settings.capture.copy_binary,
+				       &pipe->pipe_settings.capture.pre_isp_binary);
 
 	return err;
 }

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.56.1


