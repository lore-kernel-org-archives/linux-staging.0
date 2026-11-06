Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983788;
	b=YKAK9dWDidYaGQXinYsMz+436KXT+qjCD2AzgZWqFEZiOuGcc9nTRzG+jgIHghZQagbl
	 BXaumdk1H4e7lWHe07MHfQCpaLPthMARGsBUU7wMnSK309gM0Jf7jGxOa801gQCXteuz9
	 Zd46XfV2EewJusj7gFSunfbE00mBz/oKdx3xFUZ5aEvbQWJLNDLnEg3CfMrynD+4tkFZy
	 efhc/eejUoASJumbYmtsvLZ0ZtyrDkS1kBi6UB5cJUKYT/Auqp6847QOtW53gY0Xa5uFD
	 EDk3Kjclpvbz2d/Jkdkpe2IGrR3h/6CFzFrsYdsQ1cQqfP7Fx+qsjnI3tHi+dEMCbiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XqDNg4W7673UpH/nlCNn5xwA3tbLFD35COXqGvji1qM=;
	b=k24L4yKeN71fmshGuD8416ObmS2navXSw0iDs59DAS22Biy7Rzxh1/5Q7m5/zFbC/JNl
	 3HBpXTH6+6y0EL9aEqH1DOvuAxw9AjeaNwMDcpyH1nDY5sGU3A/sVwyb/Oxe3q/2L5K/D
	 6Awdih62U6g/e1HFx/kVRrVkS0N+CS64TPR92qgRxokru+BpHZFusimPyPRqiA/Gc93rH
	 U5EH/rTrMi1N8k7/m9ZbfBjWUFsR5PdABKW8XdirwoSESi+nrrAjAuTjxhuIxGNOGTrGY
	 cIS5bWIgvJKgysesFVcBqlIAgvsrPvssxdh/K9TMtJzifWfEWttLl7lHbz//oalgPsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmesra.ac.in;
	spf=pass smtp.mailfrom=bitmesra.ac.in;
	dkim=pass header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=Q6i16dxe;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BDB606A32D
	for <linux-staging@lists.linux.dev>; Fri,  6 Nov 2026 16:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BDB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=Q6i16dxe
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so338327a12.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Nov 2026 08:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmesra.ac.in; s=google; t=1793983785; x=1794588585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqDNg4W7673UpH/nlCNn5xwA3tbLFD35COXqGvji1qM=;
        b=Q6i16dxeFb6ZCex/yXi9k0TAGi6CTa3jj/CtP99UFc6CUo/UFfwLMRb82iSM9z6AsJ
         6fy46GBzsM84H3kneHUFoq2/jAR8EVhisijeSZnHUprbRjY9iaZBCk3JipTYXp7a+BbN
         F7zD0IRVzvd+Er0e2HHNfFpU4b294ab5FMsLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793983785; x=1794588585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqDNg4W7673UpH/nlCNn5xwA3tbLFD35COXqGvji1qM=;
        b=v0nOZMRuxSjIMD7fOfIw5EYoYJhk/L+H7R0aQoWqGmWXDTk26C5MFMXaczMAifsm4P
         QNbKNP2APu/rBojyKNuxe8qCYN9iHUluzEIwFSOicszwpUFFHKgTztnJRsvBL8ExVBz1
         iAivfMnaOhUUfjFc6dzwwPyKnII9MrBCYzmMTyVWic+ohuznL4qZvDpMjUdffr6QkdBJ
         jpT3ZtPVWYMiPr344HDdMFv3btojpcCA9LCu6Eqx2aM/xH5Qq/hwg472sTTt9dlq09XP
         HXgJXsVupWMqyGgb5pB3AtLdgqX6785POHO2OsrCKduHTMqQOEJhhG9IMyp5VCugM4G9
         SwZg==
X-Forwarded-Encrypted: i=1; AL+hErFw14Op2Vs/pUqPh1jsue8xrFYoTNHRaDl6w0XXSSQof3qCORyMFVl0Dhc84rGZXPba33ErO2t/08rDKKZB@lists.linux.dev
X-Gm-Message-State: APuU4Z+cs9V9dM4B4A7/wGnnU2mfr4RtXC1sJtMZJ661UnrDBhRTHDC+
	GcP1m28fptYcLhssMaH3OFW8OM5y5vsvhZzLIxVwTA9loaqH5FUqd/QYps+Dudse1w1aJlcAU2l
	Jg6bcFzXR
X-Gm-Gg: AYBFou3kWpanjliUfZoNmovRwWXzBLml02ZCOFtD94kC8fKfmkCB1MCtgXj81frZykC
	NUmhGh2uMT8Bz86fAdjii/tZQf2XPpvxxXxsxl7/iHwSO1Yx1KOCOsHm9A3mxmtO+JuA0HLpl1j
	Ejl5jBcFz+qtPM/RnFM6moMWVfYaZokG3XmVVuKLqM5vk9s0d1eXTaX4cPJEc5+NQ+Lw2kxqb6a
	tafGgSdORczbqyC03daxX0WkI5XElsGZ/VY0end8si5j3YY6UrTAdglEZeyF6aisNnm0tVo0q+x
	CHJOqIP8XAzKle7IriOSmp6KZrcFu/nBosxZ8lRp9aAPkk94SrnZhBT2A77x8VAT+XSBISJnVMv
	UgWi9M3XFc4hv7Jq7CXz36YgEsvdKyUJaiusrEM1kn7VfBe6Q8+4Jas/0fhZOQ6wpLvWc2HB2LE
	8Yw3Cc4GsjiMMFYJ/4sFqXFw0zdyfTgcTBfvhyuJ3fogEDDRmKyENX+MkTrxT30vzBAg2hBpNaO
	FMUcHIcQPtUvWdw6EQLR0ipnpJobct2+WQKz1EUA0gem/1eJZmZAGdiRaHe/kuN8CgBjaW1PCUW
	3iwrwnmixIANmugtEzf7l7p957Xa6osHXZ6qOrbC4ldniNl0tCqtOQ==
X-Received: by 2002:a17:90b:540f:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3b0db6d7586mr3040386a91.14.1793983785266;
        Fri, 06 Nov 2026 08:49:45 -0800 (PST)
Received: from fedora.bitnetwork.com ([115.245.53.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc4dc7a8sm264494a91.3.2026.11.06.08.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:49:44 -0800 (PST)
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Subject: [PATCH] staging: sm750fb: constify g_fbmode array
Date: Fri,  6 Nov 2026 22:19:35 +0530
Message-ID: <20261106164935.18502-1-btech10487.26@bitmesra.ac.in>
X-Mailer: git-send-email 2.56.0
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

The g_fbmode array contains string pointers that do not need to be
modified. Add the 'const' keyword to lock these pointers, making
the entire array read-only. This allows the compiler to safely move
it into the .rodata section.

Fixes checkpatch warning:
WARNING: static const char * array should probably be static const char * const

Signed-off-by: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274330..47d2917cc1d6 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

