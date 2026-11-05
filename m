Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861002;
	b=OAYTrcFeQBB1T1usMiF2u06AXCmV136u+DWIrPHF3e7Q1hWBIzlj+oIbsDyCniMxBuDD
	 eULLaiRLjAj3eICeX6OVjIh3U/BIs1s88CEY1wQkj3A4z0hfjoOvBgyoq1Na0gcgoSKml
	 22LQ5uRIWWP9iZYTMndisTaA6tnf0tktmI/opJD3lObVxAUVP/dljPNalt12fJiLTMu6W
	 yCcq/4JWa134SN3s5VdTaxSIPWu3s61aBXb7kqfjFMzumZjtKBDwt/4yOEL29GCsztaSt
	 DqV6Lp7rqAq4s4yqUAaWsIrmpmmgCv1M3bFeXfb3bLModhQmksyInmTN6viBCDJ7+PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
	b=KrCZrnM/aE2xv93gwC84sxek25ZGF56NzhhCaYLwGoeFrK3dv1a1D5xhYlj3LAJUQl+B
	 s1t3uCMfw7b4ViNjKmpz/0/4JoQfRf1PIRR9tDT/b7MnSgmkhky2J2x2mbPoIx+Zqemhg
	 Cog3VuQhyzgzUmY302dy2HCaEt8W0xHx5FxzewzNP26tN6GHKUyYz6qikSyspDVQ/OW7F
	 IdfR8OZgVb6RwAmuIWdVHFQh87c/jHLhq35DTu4tbJTe+eOY1wBIwITFr+GQCPjgUITWO
	 PlOzDHka/SOtdKJ/84YjV7R0Na4A85GX3zLXlQhGAUiyIDUp34WCsY54qvYa/YUoyrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UucDrU7b;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE4606D830
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 06:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7CE4606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UucDrU7b
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so2952012eec.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 22:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861001; x=1794465801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
        b=UucDrU7bBkwm1R+wsNZKjlNALb9qM992Z+B+GkZJ+4JUDSW/42LFYIp9ODIgpksJu6
         SEMaBadO8Hc6paOCEWaJp/Y7zc4TfkYJjDOiB5F4qIDvx1GAJG5N4zKw/MWLCF0BTFKB
         4eK67HyeDRmPMWmT92cXAqNE3WkeiG76YXzvOiAF6E0rofXxHauz7RsMEnVoG3aGueMZ
         DfOOCQowuNoiuPvdMwPRqpritcpXCMVIY3AkBdoSFEM3RBiDYt67UN2W/XXLpuk36UvP
         gnRaKr7Ks2aIIGAdWglAYqYezOm7pp+2lHsQR8hkgs9Xvv6Vc/60fjXl1iTYwEvq1ABz
         RvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861001; x=1794465801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
        b=wB3zJtUYD5gPKf3BNjTLWM5iGsrPMFXoOANdmOgn6lu5vS4Sj84S7/FNzXc4D5OXqB
         rKcrefyZAqeafqDaUxZKmFYH8k9/8u+l2pLjjyvqdWxgBKhSzTjVInIYqf+qgiZl236f
         6PQoR1OvP95NQllDx/45Xi4wMXelB8+N0RbqZUP4ApWaASyfADAMuxN/jVgd+AyocoSj
         3RzijzQFi3fJwlfTNsFA+gPs8kvb2B7O2uVUx8dVxlknWDo7aZC5D56qKX/0KBp931WU
         tsva4+6/O3xk+JSep1xHw5SpFPH86K397DjW5adH3vzACVana6CIHp9e9BJGUIDsdbiC
         Hc0g==
X-Forwarded-Encrypted: i=1; AKwUvByXJ9O3qiBYVe1RVPSj95gYG4YHwJ+bcWXxSdX3jf3GzcMGjFXEBsai9h5+vpK484n+dO7rNP/gapt3LTAK@lists.linux.dev
X-Gm-Message-State: APuU4Z+bE9rWRvcDNlhyOk9WbTNt8RwSIHrqlazWJbE3Ah3kMxf8Q44H
	JbIMWZDhViOjXxBdoOELuqjl72Nbgb/r0Xiv9NCMcoyKeZFOqtJn0zdm
X-Gm-Gg: AYBFou3sJ8p8OzbSzsldZnNVGF3sE9iSWUHquyM4MYApBsl127dWFz5L57moTeFb+OI
	hHO9JBUbqvM9eS+oGpl04x8pYbN9j5CJJeRKw9jqezgbGmgXyAyOMNKaAdmJy/kpMNYiDn7jj8q
	Fp2nkqAveAEkju/Ef3U3dc+S8MpLZ1UTIoJ6hAJT1oHUxrMi8bbOK1VHnrWmJ5Obroe2I9AvExj
	unChh8Lt6gD7GJqEP9u/XuP/Oj2qg4mJsCgQj+uxjuzPGDLsMXS0jiq02TCJG1RLcuYw4db68As
	eCSp9KcUlTL5VZJ02qb1f8KjteALwHqmeNv7gk0f6sja8niZD4yxD7qIidWyBppg3o3hvCtwDcp
	sEVV93j0ID9TTXSzIlpNFXom6jhMw8GlY1VLrSMGULXrV+gxlRJK4tfRSmWF2XutnzJS6+b2eZ/
	jk6dDlE8qanb18sHMsx9MnR+Ub/9Wsjb20E1lDHLJnrh0kGZnM92UCQ8rvmp0OWR6Wz2ZHNxXZ8
	IPzCxmNc8CLwKgg6LI/yjqE0lqIJWd0pcwAvZT7SAjtE/RXPdTjfXmxdK1MyU9Z6T7zvPli3q1J
	o0nf4dyLq+CEzvBO3lBUMm2n1BnSmXVXWly7264krKDBSni7Pfe18Qgd+D7QfRn4Q1AIge2znQg
	=
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr30063206eec.18.1793861000822;
        Wed, 04 Nov 2026 22:43:20 -0800 (PST)
Received: from kernel-dev.multipass ([49.37.221.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm19435759eec.3.2026.11.04.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:43:20 -0800 (PST)
From: Gobi Durairaj <gobidurairaj@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix block comment style in sh_css_sp.c
Date: Thu,  5 Nov 2026 12:13:12 +0530
Message-ID: <20261105064312.360626-1-gobidurairaj@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Convert block comments to the preferred kernel style with a leading
"*" on each line and the closing "*/" on its own line, as reported
by checkpatch.

Signed-off-by: Gobi Durairaj <gobidurairaj@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 2beb7168517f..bb916de3dce3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -266,8 +266,10 @@ sh_css_sp_start_raw_copy(struct ia_css_frame *out_frame,
 	pipe->copy.raw.max_input_width = max_input_width;
 	pipe->num_stages = 1;
 	pipe->pipe_id = pipe_id;
-	/* TODO: next indicates from which queues parameters need to be
-		 sampled, needs checking/improvement */
+	/*
+	 * TODO: next indicates from which queues parameters need to be
+	 * sampled, needs checking/improvement
+	 */
 	if (pipe_conf_override == SH_CSS_PIPE_CONFIG_OVRD_NO_OVRD)
 		pipe->pipe_config =
 		    (SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id);
@@ -702,8 +704,10 @@ sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args)
 			err = set_output_frame_buffer(args->out_frame[i], i);
 	}
 
-	/* we don't pass this error back to the upper layer, so we add a assert here
-	   because we actually hit the error here but it still works by accident... */
+	/*
+	 * we don't pass this error back to the upper layer, so we add a assert here
+	 * because we actually hit the error here but it still works by accident...
+	 */
 	if (err)
 		assert(false);
 	return err;
@@ -1233,8 +1237,10 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	sh_css_sp_group.pipe[thread_id].port_id = port_id;
 	sh_css_sp_group.pipe[thread_id].dvs_frame_delay = (uint32_t)me->dvs_frame_delay;
 
-	/* TODO: next indicates from which queues parameters need to be
-		 sampled, needs checking/improvement */
+	/*
+	 * TODO: next indicates from which queues parameters need to be
+	 * sampled, needs checking/improvement
+	 */
 	if (ia_css_pipeline_uses_params(me)) {
 		sh_css_sp_group.pipe[thread_id].pipe_config =
 		SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id;
-- 
2.53.0

