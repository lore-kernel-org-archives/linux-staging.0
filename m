Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848920;
	b=eJvKWEtlKzBC67XAy/1nJ0lOO7SoPUVU38ERbjKSdTtVLDrxDP6S8CF//oNrSe5TrG6u
	 W4uoa+MybMC7zQ/QJNM4WwOLqpk577Bo0MGxRnXA0RfVC6z20lXE4hDbC9VuW5r8IWEVi
	 /nluy2LVwymofJG3WqKawOsL36fQsk9Mm21+qdOeifIaCE1kaV99yQTn5h4Z61DPG9GhY
	 TBYU59xvuOrcGT0pPX6OZ1D+2d0ac1AdpXXrFGdUc4D7d97Xq1BP3x34WmC9yzcCcehai
	 U8r9Hl+BgBAKF0CcSGSldAums2pedrWPg4V3eJwI+yDv7bUfCdEQy/+GvhCmY0fM+lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
	b=OnhVoOj2JcY5tAJvyX5KT13DmyFU2LZxxwZajNVygXAyhFV+HVeuYVPPGAk3gRKWyeKE
	 EKB+Is5o2eAlyxwBLWiu1G7l+1Cs2fFf8v/GWmicdaVIgbJQUkWCqvOjv+uqZqg38Xb0W
	 YdcICnmm2VvUME//RTASAofSfHudbtuCvfiYgdCFUMlY9XwyecaA9QijmpjrdvxcOLLF4
	 x4hEUuFFakrYXTUr1+YFJdD5J1TOYFrtuSXbFm4usw6yhSr7MPr5IVcXz8ng4pJNAm7i8
	 U4vgAP2vHP4566s0oWuSPYyCTGPxVHjmu4/WBG7x6P/A8rlvvLittpK3HZOn603XFXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UneEMKqq;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C8606A887
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600C8606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UneEMKqq
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso4124779a91.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848919; x=1795453719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
        b=UneEMKqqQ4qDKylmQil77DieQqvTzATzqZCXrKiXmXlmMR1LVPSTIsz+mAuqUOuYoJ
         69VJCx45WjSdB8qJUD9MgP7ms2PH1rdgcFh+wbBPSnhN4Se5ztUB8hJINJBcZiKzv9n4
         nkfjkrFlyXjwVYDqWU9PCu1BnMepNMlJelaLbCX25BIRqPkk2EMnfF4uUX2vxWzKsupB
         9KVvXhHy6JS0iCb/DXZNqTx6GOLCKaeZ0PmqLA2ppdvr5jT9AnPDaRncGOXKA305XvPm
         1t0l/D6jiLjPhU1kPmOHQ8mnfgiz7G3pg1xsGEPs/cHs9rCphjJx8xFXAEyZwEswcAPs
         EuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848919; x=1795453719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
        b=trX8j0PXsN1/jEoJy3/xvDmUPcM8gIeacvGTPUba46RlmhYr7jb8DxzGlOACFe18TC
         4NpPHdWr6YVMPSvII3LBB9A0b8dgekpRGM0u4thmhV65MwDMbQye9O2r6OiOVHM6EgCL
         EtvkbkdFz80Wb8whsyRCUbO4rzkyTYtsUaQpWevJr7xIWANiFQj+0spsqNdLsVW2yGZh
         Odf0AaP7d3/gNSgru6xmRDEdaFsMvc/yszuMsx/Rdt5xn+EFU/HJf/iuPmi2IxmkX9M1
         jbRQuTemPLBok3Xs+p4vUlsE+zvHJCUhiMKT1tyu2AWtjYV8CexsVh2MaZnwUwAqtJ/4
         pI0Q==
X-Forwarded-Encrypted: i=1; AL+hErFzVNaXRO+sDpRjC8WtlQOqtF/U8fe4VT4L7Pp9sl6g8yCZ4IT64zMRG/mYOdSA9gYviGSvoafUelbXqS2D@lists.linux.dev
X-Gm-Message-State: APuU4Z/ubO0PbtD3hGNre9Zc43PUyfEizcmR0sn5/yvp895nsPILmISq
	dksp4tdcbgV3YqruVzzim05pPMBwvVgVrEkEuJXbHX9h8Fyly1kDYjee
X-Gm-Gg: AZFdTZe65Y+KmrN/G0CkBWcRGAF8398p7F42DNg6oVXOnE1IaNLMgZkDZa9b73fHPaZ
	5oZ33q1QvCvyDLQgQQsIw1QDv6rMjg+mKmOqs8nFsC4CKUeqOiFpkfMmYt+Bv2lBUKwmzzDXC0r
	cLbAXHHx/f6LeRmohYbIMNYn7oJqybb14F2QM8l4EMGQyURjcYcKVIdC96RsSoLkUBskK8LiAl2
	qnD6DnpJM0Jp3ZQWBcymFDfn2s6UR0bpBd33b8OrfgFL9frk72h93BtoRJ+yT4SP95WKOMa3Cyx
	Pf1Cg0UcLishzxpQM2QukAkraIaR7S8GQiAx6kXA/LmGkf0wkWTelUdKZuR2eGDXyx3/VfqTYA/
	csXf3B8Ex5UkphGHojI/hn2XBNnqzYFB5lX66RMVvoH4upQYupxXpZT9mz77uGfzQ0C5qabQdBH
	I/Zl4YUxPu8sQxG9Aixkct/rPNZKUAumaK5kg2oognfaHO248HbI+DDocEMi5rdM+yig+NMrjdY
	ASWfztRWvNiO2Nxc5SyVmY+r/V9bqE5SIExC8EiU5n/st1Bwo68PDcyZjA67lbfodd/8oDyzaQV
	tmhRomrn+rQ1qBMGlYSIHHyvvHHTSEvcBB/NKH3HCjJqRWqArRIiAHXz+Km2uTbEw854xsmEHR9
	5JwuaN0vylP+JOO7TPKo=
X-Received: by 2002:a17:90a:d2cf:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b1b0b669d6mr10573905a91.10.1794848919484;
        Mon, 16 Nov 2026 09:08:39 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:39 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 2/3] media: atomisp: Remove unused get_sp_code_addr()
Date: Mon, 16 Nov 2026 17:08:12 +0000
Message-ID: <8f23e8ab1daadcff28d8b795c895ad3ca955181f.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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

get_sp_code_addr() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 3 ---
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 3cd69284f..f8be93e03 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -25,9 +25,6 @@ typedef struct {
 	char      *program_name;    /** not used on hardware, only for simulation */
 } ia_css_spctrl_cfg;
 
-/* Get the code addr in DDR of SP */
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);
-
 /* ! Load firmware on to specfied SP
 */
 int ia_css_spctrl_load_fw(sp_ID_t sp_id,
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 78f00f07b..49b986351 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -104,11 +104,6 @@ void sh_css_spctrl_reload_fw(sp_ID_t sp_id)
 	spctrl_loaded[sp_id] = true;
 }
 
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id)
-{
-	return spctrl_cofig_info[sp_id].code_addr;
-}
-
 int ia_css_spctrl_unload_fw(sp_ID_t sp_id)
 {
 	if ((sp_id >= N_SP_ID) || ((sp_id < N_SP_ID) && (!spctrl_loaded[sp_id])))
-- 
2.43.0

