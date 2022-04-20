Received: from cyan.elm.relay.mailchannels.net (cyan.elm.relay.mailchannels.net [23.83.212.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FFF7A
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 06:15:27 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|ian@linux.cowan.aero
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E62CB121667;
	Wed, 20 Apr 2022 05:38:11 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4BCF9120CEA;
	Wed, 20 Apr 2022 05:38:11 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650433091; a=rsa-sha256;
	cv=none;
	b=85AuY+1LQjpGEIlT7C1k3SZb4WNxwePOppjOIqb9zwlL5E+R2Sti/uKZauIYTfmSREv0Hy
	9OFgOLP411uhYvrw5VV66P2t21DrSgP88sEJV2/Y2nqATNpxx7pswWm4ujgOa+/t9ZhKlL
	+kD+pNifYeQfYp4XZOE+hRMyfWCZ6XbfElsVGYP6wz+LpG2j3z7B+PG68AzJglg4mP3L/o
	Tfa5cg42ZbLxDaUdS7RgyWF3/AVFeBx5kqw3ogsGj8YgMv8O4iSKKvbOkKQ90vQRNFb/aZ
	GZLiTSKK5yInb1/eA+Hj8SxfS2b3H4XqdBsw+t2nd7cQWXIHgUM0uhYzfNl+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1650433091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=4j5q/8s6WD3XxXc1DfuT+A3MrhJqDvKeJCUERHUYZ9A=;
	b=Jzn1ex0xxRwsStoOzxkEUzJq3tgpi2uTaY+ofL7JSYLBJK5lvuTW6V/oDWPnUax1HBpkR6
	lW6SzK/tyi9grrh2MtV5abEu8ZMDNuenXISlyZ+lTHCH5Fk9m5s59anQbh/JvvKKKAWE2g
	KvxMwOAa5+zCQcoSEgTzhmuiSFBM+hw5uY7N/JSFiaQbtoAAu465GEWvRuI4z+qR4/wE5K
	kiG8Stf9GzRSwPElI0PC0NgLjll21OR4RRRPRIsPNRUonFPmN6rmN1TjqPWi3LEuiZ1hpn
	flcVgEYvgyEaN9XZs371+kNp+tWNcVpeT5knqlXDmmv5DFXRmRb/t5NdL2jQmw==
ARC-Authentication-Results: i=1;
	rspamd-5fd5798557-p2kts;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-Sender-Id: dreamhost|x-authsender|ian@linux.cowan.aero
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.38.131 (trex/6.7.1);
	Wed, 20 Apr 2022 05:38:11 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Desert-Wipe: 3817108b53f6f177_1650433091709_3846001985
X-MC-Loop-Signature: 1650433091709:2060611678
X-MC-Ingress-Time: 1650433091709
Received: from localhost.localdomain (unknown [69.12.38.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ian@linux.cowan.aero)
	by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4KjqFt2CKMz3H;
	Tue, 19 Apr 2022 22:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
	s=dreamhost; t=1650433091;
	bh=4j5q/8s6WD3XxXc1DfuT+A3MrhJqDvKeJCUERHUYZ9A=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=Az8I7ralvEJTMLNiawVZqp+XwwEoNoa5F/4PPuHpLoh8HTQIyv3xrbPD2BrhNaFOh
	 Nvy0B7NmVj2+7i2IUxMfBTG3o6oYxbfmM8rRWLj4tmyQRITgfmsABdmzYmd6arm5pb
	 k7w07kOKxyraycHHmLTllIyTlmUh71sveYiiMfJI3wJYh3U2WyutQ0MX6NeS2w8gZP
	 SrkuMfwAvOsYZGbug25mGWSdI3qr8kTpOgVopG4mMzcbo544EN5SCxXyBeXjohH7Bt
	 t9mRGjuSsqFCfcd5AvC4+9BzoROkFnWF4x5k+01T6wVU5k3mz6cf4ekEiBbgD+NCS3
	 ao7sNDmEHjpIQ==
From: Ian Cowan <ian@linux.cowan.aero>
To: vaibhav.sr@gmail.com
Cc: mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	ian@linux.cowan.aero
Subject: [PATCH] Staging: greybus: audio manager module: make char array const
Date: Wed, 20 Apr 2022 01:37:55 -0400
Message-Id: <20220420053755.48934-1-ian@linux.cowan.aero>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the envp char array a const in the send_add_uevent function since
the value will never change. It will remain an array of the pointers to
the various char arrays.

There does exist a warning when running the checkpatch script to
make this a static variable, but there does not appear to be any advantage
to make this change.

Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 0a0f0a394c84..c9d223b0e541 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
+	const char *envp[] = {
 		name_string,
 		vid_string,
 		pid_string,
-- 
2.32.0

