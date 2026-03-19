Received: from sonic310-57.consmr.mail.ir2.yahoo.com (sonic310-57.consmr.mail.ir2.yahoo.com [77.238.177.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6750B352927
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916623; cv=none; b=nnlkLY8HWx6tA3D2ey2veHlgFSBRKTMbEaWAO6lx8vESqx9kIU3UMT9TMD2cCSvM7lL7uBNZ5S5paSJUlFdgY5dd/jdREKux9YDqWvLIbuYioqeIkLY/6fnElqKcyJm9YBZkWaSIDU7AbpB4vb+xmqObkoXAlF2TFsksEpnT9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916623; c=relaxed/simple;
	bh=1IIJF8wjTF9m3LKwR+KdWGpARE/LALARHtFV3b67aHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=YVKU8I3NzhoxAfON+6i0krtbW7iTHejY+6pBPJUdd+bmjCdRlMNsfWZkE10xrsuNOH3VySNiw9P7JwUL8aylGjzh7vGcFNf5kixoylRDQuyJXyyHHDx4GeotFKf+871ry0gr/78y2tOTnLolk8pLyUw3U7DDkLlM0GKCSUFk/7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Jz4bd8zh; arc=none smtp.client-ip=77.238.177.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Jz4bd8zh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773916620; bh=xfM0/e4lS6m78QHLarBmANNGpXwraT8gDfySSadhh6I=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=Jz4bd8zh6D6ZIiV2vtY6xfT1+YUSIx1EubE3nNb9UzlS1f0R0pCJHWPeLJZVWWD5269Zt2rjwgediUZGdNw0/ligwgNX1CWmUR41NClpFPxX7Dgj2Te/eNRAXPHRkXLLCl9SVuB2xjk8i5WDZwPj+hbsgH4YiGdudjfkZMRKkn+gmALdvLGi1q1zZJwgENSalJCLuKoTgQ6aK5o0BhWkCV5/ZEOXGIKEQ97qQxaTEMdeMQCqXtuog6dcMqbQ0Sg8+jlVY+PeRQXymRvaFzO6CduUmZd1SO8vxVGFDr2CKuQVykwRp5cP3/VDQmwQ5yi66BlGQt85TUzOPkoSbVN53g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773916620; bh=v+NukQcRZHoTMcG4O52HlsXXZbwaddKMdgFRdo3Z9Y8=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=ufVU5Yi3N0UKiTUiokiAnrY/WGHV1jcw4dX+oshZyAheec4zVtPxHVdO0+RL1hwpgWQL0es7/bnjpegZHiPj2STD3r66LgL1a0Zb1bRzuIBPW+sqD5+XvI3Vc0UactvhmXlEdUjESoDpz6UV0XV1PkJ2Sv+UI3eD5F4tt7y/gjJxux3I6efyqbsu+xmFUhTSJZbk90WHpDVikWv8EJzAjC5GC1DOf2UPrAP1KKMxxn7cOdgEm21n10MrAUPRwXRTLAsEo6UxmF+9+PPQUDS+8HXKhwQGYZDcoQ92fJXXrVjUcgohurqxoMhDKCgWSemRhOb+YQ6wBbKHwnpzbhoBVQ==
X-YMail-OSG: a3b9LtEVM1mkByRVpzL7xEfOqhBYzsql12SqpLgtHeRNHBzj7G9Ot5vu5wjrCO0
 QnZ2xXo5DCxiJZopMh82SfmBPBlxyAShf.3QmybKiJquxe8sUd4Jc0M2IhBC0Ho52GwSqhds3BMD
 44_47oSGj9sevlKW17m8CRlsYI99ZPwoaKVI2MwG18f_hGqxOYNB2iWppXam1eKgf0kvOn.kChgP
 HeOwJm.._5FAhthpY7VVblw5lhkjK7bjnKulRwl5Rq770GizpG0iBgOeeAPGgaQbC2csOecPmcz5
 GaLrMcL30mUqiqQKvxog9Fhems5WtZ2t1OkYwoHXToFmDHW8jADRCz7b7idgpn08PwX2J4W6gyNk
 6ujyERy5otEEZjhb2U0F5ey4deLgS3R7JQBDdX0jaBydkaBCTQKsCILx4wKMZhgoot1_y1BQk2TV
 ugXaV20x4.LLr5GVgWphfr.TKb4IJm1b6S8oA5dsOFeHB4v1bKYU0.xtdNKEd7xI4vwlS9wtOh5h
 _PcaT7JllZVvUCL_PrmGBFDoH.u4vLwppo_jkGZN1eW.gjEJk1L0u2gtZauVK8VWhL_ewVKi93G8
 .qHWXYnKuaIZ8h99suvvJ9knU6Cq6WDL.vk10UY_7YkerUSoRGdLfiLaxZTW1PsENpzoLK9KU8c5
 0V3sZB7nApA4RcfquAS3E5Jnosp0Sp_nIZnInWIjAsBLwForaU8n6NWLI6y0vajqSiRdVRIDidkZ
 sWlPF27jlLGTsqOLLvkqnDYwbSSwihJww1GbGRIJKEAZh.28FzXniHwdE4gK76_TNf.JSmV3Pjxb
 FEsnlct1yebUo62CUXAg1YhzBlsDdvPLlmxcRbWHIpqI0Ag96IUS6Am1H_p9SSVIyHrsyJey_834
 wdfdWQThG_448W9Q5vKjULkAdJxj.Saa5s8QrGupa_FPKiNRYDs7MoCHLqhFw3JpW5YB3bvpZ66B
 V0cpgbmTrC0a_uN6p6.t8884rJnYRtvsnGDSbO739lFu2rfDBrY2Q9UD_Vi8Fn3YXJquRaf6Yre0
 RLNUw3kwVt59TWsaItygjXvisHaGNllB_1MyqAWTpxbXwzb8CDtlq3bnSxwStTzbjYXIZbGzdw9a
 2uBcUJp_fN8FZSaOJXAOdKEyon1wwCTfy_2nP16zsYo7WuGH6lBgFArJO5QBERdIVK27g_HdRv5k
 STsOl80Sr.W9emOzn2p5SrhhF.vwQVkjQIs1dh.kWNWEfuxLpLc8XMrGCikT8y7FXV5qgiCMT7qE
 QYMUjvNKN1CzkjhWD3xudpyiZt.AEwN8KlQFhDFP6dy6H7Rjz19yuo3mfqjOUjZD6E4LAO82Bbmd
 bKb4oFteDB82g78x682XykLfkZnkwF5nxaqZ6ZB67N.gYhDrKQDI1Qf5ypZoelFicaTenXuzXN3R
 b1Ao6BtYdiDCyoe9e2BaKXNrX05COypdZfbwGvk5BeF7keDgJrd5D5dIwue8hGOeGrW7kEv27qaf
 5L4SE2mlXU.GkWQWj5DzFuz5umzIZ7cJjxhC_RkIKBDJ0r4y6tmW1.epYmU3VN7YOW40KfdGYETI
 dKV6GSHT.TLQc4prMTwQaPOPN9Erx8UfOkrFoQpVUQy2.yfO58YpSEZ9QWHHA6VH.ixaMHsTmB9r
 O___cCZ3az84x9LUAnopMpvRdvzxxrqbW1Q.NdaQe10p.WyIZvr6S4onKktYr0xyFjy7CTN5sXfT
 zL21VZCurE2HEJGunAyae6NbGMaZqjchUv_OF58KKvHSp5Wy4pmiItbQ0wBc9D3NkiGWZVD6NZpM
 z6.f7Gv0lG4wIvCDLqF8TF.l7KGEY2TXCdgqSFzIPITtUVUHfmftf7O_EI9EJbvYcoQy8vHCPe5z
 RcNaEMGVPgVXHhF33tpZ6SB60MCpfrolmQxqj1v6oUq77G8TibbZUvf7rzwhB0ebXAoZ2uf7k.0n
 QRMJvlQY3JH2so7wD7EUjlo.1_MBReWjMJV.lTqaPDGPDklZjgk.durC1PFkAvCJQZK3TS2nicEk
 CONdfOhJ9ynDf989OY8YrOpN8rJQgfXXPS6461n_a1VIoP4KnBldMZ.HHFCIgu0t92rf9A2RduOK
 .Qet7dbckaX1o6hTPmEpAU8OIhtqdo0s6tP8EAODPos99QTFKnPWPjMnGxXH9.3dq7RhMkq0j97A
 qREC.EhyCrBv_7c5QEPBGsLQJjXF7h39G5dnYqBXpLrMeDaHlwsZqUrxpaaVzLI_ezIXEo7cgCwD
 6KHUQCKEaqgpfUZGdaQz1AeQJeN_DdqCjPw3oiQMOFpL7EaQLKs5XivrA8iAfYb9GnI00cU1cw_O
 40gL.taqNcenZ.LnHTXk2GQdQjFrU
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: adc7bca7-512f-419c-8948-255b73fcf678
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Thu, 19 Mar 2026 10:37:00 +0000
Received: by hermes--production-ir2-bbcfb4457-t82gm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e3aadecd8b01c1ad0fa267ecd79e1028;
          Thu, 19 Mar 2026 10:16:41 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 19 Mar 2026 11:16:37 +0100
Subject: [PATCH] staging: media: av7110: remove dead code in av7110.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-av7110-dead-code-v1-1-da6e76804817@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqAMAxA4atIZgOtf0WvIg7BpJqllRZEKN7d4
 vgN7xXIklQyLE2BJLdmjaHCtg3sJ4VDULkaOtNNprcz0u2sNchCjHtkQfGzG2hk58lDza4kXp9
 /uW7v+wHRH8UQYgAAAA==
X-Change-ID: 20260319-av7110-dead-code-ef974a5d7faf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773915400; l=1074;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=1IIJF8wjTF9m3LKwR+KdWGpARE/LALARHtFV3b67aHg=;
 b=CdIpwxXhJo4I3Czst8Rxa4a9E/VESCQdQO5nQHqFJm6Z3f4vZLi/cn9xRiKn7Tu9L2Wm9F1rZ
 khEFNypTmUbAQ5jBZqPeJ6ep8cEfDpm9BhKxuj9RBzyHWUTAQVSlqre
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260319-av7110-dead-code-v1-1-da6e76804817.ref@yahoo.pl>

Remove two commented-out lines of dead code that serve no purpose.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Checked with scripts/checkpatch.pl - no errors, no warnings.
---
 drivers/staging/media/av7110/av7110.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..490963c0ccce 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -314,7 +314,6 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
 	}
 }
 
-//#define DEBUG_TIMING
 static inline void print_time(char *s)
 {
 #ifdef DEBUG_TIMING
@@ -762,7 +761,6 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 	u16 buf[20];
 	int ret, i;
 	u16 handle;
-//	u16 mode = 0x0320;
 	u16 mode = 0xb96a;
 
 	dprintk(4, "%p\n", av7110);

---
base-commit: f3f5d52d6bcdf190891601a11910cdd596963c1e
change-id: 20260319-av7110-dead-code-ef974a5d7faf

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

