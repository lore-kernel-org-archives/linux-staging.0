Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72D32F25F0
	for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170648; cv=none; b=Hew1ZNnjt+2Z7tkBL55VAxEAHKmrwXgvD9rZuk5waC2p/MxThLGkTNADUO3tU3471iZNRpJWh3dE7bfg6m1xLNrvcg0tiKeLLqMyueVrcRsCGxXdG1XHKoTGN1me4Kw5zOuyh0MVrSGEQuKa1VcAJm0tUm6U7EMsy86r6RSwp4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170648; c=relaxed/simple;
	bh=DkRhZdxei5qu4BgfW3zP19hCloWvhT4FwV1aeSz2QZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gv0sNo02D7Y/VmjQWpippAdfewJRxGjqyTY2XoymJ6ZZaN+NjZTDLuwJCNxzuEonzNlwIcW6KbfG/oxEusWVi2qn7NYSqotbSfcmIdjt8KAYuMTtkZZS2rNi0206dgpIRfo0Kj5Es/62/SAuYib/l5L92SmXgasadgaXPhZ63xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXEjT5nU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXEjT5nU"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34abca71f9cso1215686a91.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 00:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767170644; x=1767775444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTA4UpQquInN3DAlR0a58Y20HDQ0cgvOo2wpk1OQ4QQ=;
        b=mXEjT5nUFMyMzUoRkQb2/qA1EXUDpNYKL/btz8GDuCptIV3RnMRbQvfmBweGHo+HBA
         Rdzp5fIuC121YD4Tzhkt2SuDfXgr5bYBTtOqMu3t60LWwtgt2NM2261Z3oMh8yIfbkzz
         f+H3/NM/Lhic5olL2Awvsj57t/O2iu7B6Vzhdxdz8RqAriz0KQanp1T4Y5ag/+MFTMpT
         FQmVO7MYgqzkuRNIe0FJid2gKJ1CXX4d8FE/+Tal3OlxTHBku4nUBjp4fvtIdGyB/c++
         x+8Yj2bmVLZHGTN9xgsREqD9e8fPRrdos8JqhnXp4xw2zTGGZU8ZcyxO5btod4oJLjQK
         EcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170644; x=1767775444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTA4UpQquInN3DAlR0a58Y20HDQ0cgvOo2wpk1OQ4QQ=;
        b=FP+kLVe2Hg9MrxQfoAPcjuhlFolNBTfcY905/AyF01XIn/3FpZYEQb+MRypA9QDXzN
         V/x5AsthpZmiuT8frqwVAwcpar2/P6MuZFzgMK+E3fn5NLbUyhV/PvMV8roPpV+DG1h9
         HgJRapLHDSqxONaNTe/BSCojMiyV+Ngeo+hnkLJ0MHosl7p0nT2itSCxWbCOCAOA9j62
         OVyFFiv2sm2rNibWomLSoqdFCNNqSaKd/heYCTSS+Lh66m9WgdtddOyGIlpM6Kwyg+M4
         vBYGsJ7eKVG2iH7BgR0/cXTE0FQFfXIwK8AVGNpdm+nhd5iLkKqYdqFOuKBAbRIm8O/J
         qznw==
X-Gm-Message-State: AOJu0YyJy5T/6dJLbMvsxCenFA1JnKwLZHc3RNrjz+U1I8rZwjLa3ICN
	SabblkZhP8QOG362/CWpG9PtiKh4DFzfYUvY/8SA4/cQ9jGER6nOmh61
X-Gm-Gg: AY/fxX4mqQeYiU+9990cQTILPdwTtzJwZ62j6S7jSQlSOaqWK+GTiMaja1vEiRUUmqs
	lIErHCjsmIwwlLfNUqAWIVpHMpjU8tCQksf4gbDf1Pr1u8TJulLny8l26sCKLKou1dMTqhJmBQN
	+ebqXR9+an4sfKajvDEVV2wUmEDrqIbK7boXhCl+lDibZU8PM+q6kT17OgfID3h7ZVWbsNAvTPW
	0ZIP4ClF0Vg2jXjlKqf0o5ydCsrlorNCeihoHIzuv4+nMq5Msf9SxkwLHjQVpOZW+eCx4SGB6Gr
	MYAr2ugsEtz8ZIapNMoZjXexc5P7oWlk+PtS95bLB5QpdKtSYAECj/DoraJXMVneo8nxS9XezCE
	VF1F0jJ7Itky84lsGEeXZLbCBre0HqiW/J21RhJcUH4gX3E///QmCnKVehZhxaIxTrJiGEbko/S
	yLuxMOYfFg6OK6dI6psIQalA2qyONCwFBIj1NqsmSQEsVS8LE=
X-Google-Smtp-Source: AGHT+IGtYGqaJ648hOJVuyXLiBXDMLOE8warfEryKmx1T4YYeHLZjOzbI46YYlazkFx8rhkYtJKgZQ==
X-Received: by 2002:a17:90b:6cd:b0:349:9eaf:34cc with SMTP id 98e67ed59e1d1-34e9221b109mr22117063a91.8.1767170643720;
        Wed, 31 Dec 2025 00:44:03 -0800 (PST)
Received: from zlabs-hw-ts-ws2.csez.zohocorpin.com ([202.0.112.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9219f03esm31475378a91.4.2025.12.31.00.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:44:03 -0800 (PST)
From: MottiKumar <mottikumarbabu@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	lkp@intel.com,
	MottiKumar <mottikumarbabu@gmail.com>
Subject: [PATCH v2] staging: sm750fb: fix const array warning for fix_id
Date: Wed, 31 Dec 2025 14:11:30 +0530
Message-ID: <20251231084130.364502-1-mottikumarbabu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202512311146.XB8ZVrTY-lkp@intel.com>
References: <202512311146.XB8ZVrTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is version 2 of the patch. The previous version incorrectly
modified the g_fbmode array, which caused a build failure because
that array is modified at runtime.

This version leaves g_fbmode alone and instead applies the const
fix to the fix_id array, which is a read-only lookup table.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512311146.XB8ZVrTY-lkp@intel.com/

Signed-off-by: MottiKumar <mottikumarbabu@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 7afb58561a0c..092cfbadada4 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char * const g_fbmode[] = {NULL, NULL};
+static const char *g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.43.0

