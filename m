Received: from sonic303-21.consmr.mail.ir2.yahoo.com (sonic303-21.consmr.mail.ir2.yahoo.com [77.238.178.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9224D3F167E
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179378; cv=none; b=NeDkeeU0DHO92lPdD76oyMsa7AzY08pZ0+O3SYotaRBKYlyH0kLRvjujLj+exrD/jkhvRCNdCEQOaAbw2hE8kx2Oh4/VSYwOiquY6e81wa4UmKTOBmK+IWx5qu7O90dxTKRcMf4I5IcK6iTXyvqreKExEMJFB55brLhSuynXjkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179378; c=relaxed/simple;
	bh=w5SwlclqyXTdbKGjXn6it7SHF2Xr+jHm+FosCZ0szSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvXys1wqKDKgnt7Eoq/plnrLWohiWo0rmbEKDIJuEVXu0/QU0NPCQZBof4eC6kvUFeOIYQYjY+OEYf0jYMYLaxg3UHgg6NU08iNjyB9bsbCRz/HN6CUyH4JXlVSnjm56E4s2GNu9OlYYHFrL90tBOGWp4XeveZwuqza0M7wVHmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Pdgyghnv; arc=none smtp.client-ip=77.238.178.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Pdgyghnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179372; bh=j7EBde1GQXSXhog+I8t8P6zMaGxKlAuOTjo9omb7Eq4=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=PdgyghnvyC/Ydi+xL14sBZalXjHUDFxrzbKThkeCTAyAbG63SegZps59CdKilzey48jfxSPi0yX9pDHTyMUhxXZxW5dKpgv2MByIXBJIh7zbshekT/fjoX1KogNEGmdpvhp+ltFQlyZYkMILflm5cBfrNAjVO91kKDMsZItp1Ws1bUKmiyV8MzW9HDARsiM3CKPQfU5590yT0z3GsM2BFlsDn/sfc5f3qjpU9GhUxbTJLGPhRWHGSkZiuzR1pggKPmkq97FcGJ8bHUe1dXeGRSPuy0uMNtttnEslWTGgcY0ECymqBhr4dnHnIK09mfMF20xnNJWGxF3oECu4lse8/A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179372; bh=2j8XcibKDN1W9WWNaL1bUcWh9zRwum7DR75SM8mOfdf=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=bdKie2aCHDPNrqrL1UnW+iGBLvXcwbI5PWzm8pLUpuIR8syQKfr5r/5eA3t8MYcQOzlewXwCvUorg6VHGQc59Lshs5sUVNx8Hv5fNf17X7th6GdX5ff4y8phket+DpQTplSrzfJXyqWeNY1WKXZ6ryMl74/+EAyzSVtHmrawfqa8psrZcgwyw3rjTDz3TtyAPZ5zuHBEFE+6NU+5HFOgxCz6pUdy1QVaAbFn0fDM9WO4y1JSqbhtaJsELoXRExTF7r+CRzEyHLu8DykqBzRUuHXiSuS5Dhg92EnetFISWdaf5x7tnyyj79XiuTQm/q+IWZVGJKZl64gfESEjjWv55Q==
X-YMail-OSG: IP4VSSwVM1mRbaR4WtO_XfOp3QttJDTKulFjtbqp5S76g6rqho.pKymEgmJ6Ddi
 MHobJibdPsWV0ZQqclgxJHvsgmLL8nljnQM84sObes3Vyttq4MsQ5M0SplWUt4YdfQZHglU1yC6A
 XEfnUaGEVwbtZ_zXWEQvMvfYF6eYe0BP5E1r047n2TJ6OJ3TuT4EHZbeF9eZZg017g0HDBs7NRyP
 hMPBCxn_3sEUMsj5Z1lkWVryop7KJ0XPjxKnX.VQEtZm4Z25AvqTAOgBwhRmS0agiqKiNiLrWwjC
 C2wG5EjzaG_NPVn0Z4JbTiHVVZ3eTHQXtOH5DtfIktxm4KBgv22F6Qnl0VYbgCfZCalvZrx25Z2C
 Es.9OyYo6kkquWAEvpo9QtgvetGH5Cx.oYWJvpU0Adea1OAlHcYtD55WCdgz6yq3lYIUWwU9uvHO
 TBrXa06UGHqIN9WsoFI6rTZfk7M0YvScl1qXZrFMCRlfhb_JFAFNMinrHZxRR0IwD6x8GoZ4jF5C
 2RySN53JaGX_TGicNO3BGIA_MipX6TZEGSSPxfp33ZdGk9OUjiOaNFy24vQwk.exF4G.eHAzpCIN
 xb48hRKYA54BAargtfPNTmQIGn7h77UZUmoCGI8mH.B6sidUjdMcuLmGPAL.2zc80uedu.0vOrow
 lQNmWYYm6Z11vCBm2lJTvyMXl1z0vUXXmdU1xcBI8SPUZOHPbFH7hXCOp2MpcaAUN.nBcVhwMaie
 XsInpz206q98AqhKzFNvTc9AI82XiKe7Z4BodimwSRUIV6NU0s72xpR7i9dWoIUFRWKhwjBITK9U
 I8Pz9NR8Q0DNe8rSPPxZXWb6G2XB7gcFlYs0NjW5_EmNkhVZio6c3L8f0jDSIHtxdX.XOdlQY1qP
 1WVITTICA9huN5VqwKRVHnp6heACLNeBdd6jqVPROl_NpQ2.yljPBxurOeVBmmfVjdiH4yo4tEoz
 X1TlZgEhHyNH3lFXKoydoPlv7Eu.65QjKc7GFaQVU9mWjYdh4fc51j80YXTaFqAWykTpCD1tDxGJ
 FC2FMtKbvTolxFcycVT6T_AYByGfh8ipJU8godM4K5WRszwE.4RUbygkE9QSDGVYu5hWGM9PTIIr
 og_Sn9rGOyP.7muQPYq2QcMmi2rXSfN8koEE4tPwa8RPtMm_uj184h1VMAePOpoJP3wzZdbJvpsn
 6b.N.O9nziFCBjHDY4qEXUogIkTMd2tbew798_n3g7bEJj3AyAEVhv9e5zJhlAlTjZhtZQA.Y3hu
 UZEW0sYxaWFP6jDGzRorI_9Y7v2f5fFLoQ1mrnStwYO3l5BM1BDknTgozPwfibHho1tY6pPJSYp8
 hkiJctN40QJc26XxXrpI8zAes2CqKKEgklbsJNGsi_6zHfJhAUpoOH12D6T67D5epzhgGzMJ9V2.
 bvmaDFQ5np.rKTfupkKkobU4ijvEC.70Dp9.qRsEB1IFlprtgAPM1VUY9ymm4QLJ1.bSbcHjyDAC
 hZpT1o.pMQGolvPO12nfl5RVaQ5jpK2UkjvrVgTS8wRhHcyyhHBVntNj5k_Jo5HOUVWjIzfEMmoK
 4axGyiCHPeb3dh2DSAzSPgbCQ96KaTUhhxf7t1wNOYUcSktK4G84.4jNDYO67.Bc6hT_lvMk0CO5
 FWq_Zariper9vkJuEd0on5EBeoTpZrFbMKBHIOinn.adWHVVASG_2iOHceJfR.RuRECWS_jQ9NW2
 27LBu.uHdbEttYBjSvNUrfgU_WxBAaLn3OJDXZ7IBChQWa3NdkV9nPrViKO65ovtyyMiUVK16H0N
 rTy5nF.mmTYc5sQiLJq2iRma7A2UiIT9VzOfbUNGD3xbDi8xFP7sVPe9TY.SvAB5pDM95d4rpSjn
 Gxiwry3PSlMtvgj7OmCDQgEvdNyTQGsRi7PsJh28bXqNQq9tljbFt5XbLCkKJuVUEgGeTyIVnqaC
 lEIu5xW00MycyJktyAwZzmvCvf9zlrvxwYACg8Lb8aYZ0w7wmb7nDUAvNpjHqIIj43lpPTK1RvnJ
 WNP7tATJ3glP3G15rIDq0k7fZ5daS4TYTCrHQYCbo1v6OPm7rSwt87xn0UEg0QCFPGPpAcopjAhz
 tgRcok0s5x6LQcfAlMD1dyIPENFRASrI.wRfpz4_9b0erZ65bkcxVVe29FyrEAbSZniqTlHUvJsL
 zeNIBh75fh_vazypmaMJTi8VUu2fxW829bUNX60EDw3A3vXz0UTO6fE6bIH9kOsoWvHQB0TjHJTC
 ZDGKKzz906KXZPh6p_UhlFyi6izWnwHthtSf23ZI5uFSmEUs274ihMQEsnsfJPOJuPENerMDK533
 U1gLSxwgM3A9EC8E5ka13IIs-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 08018d20-739c-498a-94c4-4c7e87b17ce1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:32 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:23 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:19 +0100
Subject: [PATCH v3 08/28] media: staging: atomisp: Remove unnecessary
 return statements in ia_css_debug.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-8-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3

Remove redundant 'return;' statements at the end of void functions
in ia_css_debug.c. Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c    | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e..2e0a13938d89 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -136,7 +136,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
 	dbg_level = trace_level;
-	return;
 }
 
 unsigned int ia_css_debug_get_dtrace_level(void)
@@ -315,7 +314,6 @@ static void debug_print_fifo_channel_state(const fifo_channel_state_t *state,
 			    state->fifo_valid);
 	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "sink accept",
 			    state->sink_accept);
-	return;
 }
 
 void ia_css_debug_dump_pif_a_isp_fifo_state(void)
@@ -364,7 +362,6 @@ void ia_css_debug_dump_all_fifo_state(void)
 	for (i = 0; i < N_FIFO_CHANNEL; i++)
 		debug_print_fifo_channel_state(&state.fifo_channels[i],
 					       "squepfstqkt");
-	return;
 }
 
 static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
@@ -386,7 +383,6 @@ static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
 	ia_css_debug_dtrace(2, "enable_uds = %d\n", info->sp.enable.uds);
 	ia_css_debug_dtrace(2, "enable ds = %d\n", info->sp.enable.ds);
 	ia_css_debug_dtrace(2, "s3atbl_use_dmem = %d\n", info->sp.s3a.s3atbl_use_dmem);
-	return;
 }
 
 void ia_css_debug_binary_print(const struct ia_css_binary *bi)
@@ -441,7 +437,6 @@ void ia_css_debug_binary_print(const struct ia_css_binary *bi)
 			    bi->sctbl_width_per_color);
 	ia_css_debug_dtrace(2, "s3atbl_width = %d\n", bi->s3atbl_width);
 	ia_css_debug_dtrace(2, "s3atbl_height = %d\n", bi->s3atbl_height);
-	return;
 }
 
 void ia_css_debug_frame_print(const struct ia_css_frame *frame,
@@ -526,7 +521,6 @@ void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 		ia_css_debug_dtrace(2, "  unknown frame type\n");
 		break;
 	}
-	return;
 }
 
 #if SP_DEBUG != SP_DEBUG_NONE
@@ -809,7 +803,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 
 #if SP_DEBUG != SP_DEBUG_NONE
 
-	return;
 }
 #endif
 
@@ -823,7 +816,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 #endif
 	ia_css_bufq_dump_queue_info();
 	ia_css_pipeline_dump_thread_map_info();
-	return;
 }
 
 /* this function is for debug use, it can make SP go to sleep

-- 
2.53.0

