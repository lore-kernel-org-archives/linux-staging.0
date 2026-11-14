Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650545;
	b=L0YQxD9rMPoXGUtKKOXJERe5rhQBaDvxNf08+Azr8Y0H6BVNye2VfN/Hti3yeXSyjWG6
	 ej31wu8FJldaDl7ymgtzMHWbDibg6xYZnNhPGqyiRQWZvXq4Ge/vJ0gjU9cs2bXtGL25j
	 wDzo3722kN2VzJs71GbfpVppD1eizH3P5FQXfUxuPsAHUQsgxuCa9ObiPVbQqdvOcb/KV
	 28m1LCFbXa0HPCTuDvv21VUVfToDUhvVCxuQTGQ2/rXB1sLRqSCEkms37k5lOCmipn1xV
	 sDJzcLHLKMECf0DAMUe3Wi8BXIBkPYteITRq9+tlY69bwDTwAW13yWo2Q3O+jwgYLZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XwFZMvB4uY9ceiCAZLjceweMYbxPpefUPYbylRB7SRs=;
	b=q6Ia3yE5Uba6WtelfmIawZcwSGR9Kf6tQiQ3bxSsoVxWyBKcuRPglvaGYkD7Oxgk2Zw6
	 1bBQqRQtjCdY+Yv/go/t9zvJuFAm4MXDQrYXa3cd8m3xiIYcgeZg7E3czk0WkjMLNPlcK
	 KD6eDuuPieMwcaqLm05wDJCrGbbOijIIw1uk3EYSc0Vx6KI/tKEq5gyOJLj7rNUnPEjnQ
	 4l+8J9d0np2wM/vJ7pLFPhMUuXACLpXAEDP86CiuM8bZSEz2obj2jbHDge5x7vlJ9sc9y
	 CYBbGZ6k63wfZckx4mMSTqHXaBWtCJrFnm1boDUeUzrXSHSaPwLnaOEOsuOTfzAkdWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1o9gtOE;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C69606A336
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 10:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C69606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1o9gtOE
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so8477835e9.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 02:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650542; x=1795255342; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XwFZMvB4uY9ceiCAZLjceweMYbxPpefUPYbylRB7SRs=;
        b=P1o9gtOECcFLklNB0Ooj0g9pepyQ2CcC28xpBH80YFMk6yu1XjgaPyr9JTPtUPwvYV
         KXIWRHHenIdfDHNVWANNRswlh7FWiaHuDfFznmG0KMVPHjjXMJeG4g5PdNCWHmg3EBoK
         QHdCR8CKCdtu+OMO+CufK0cBJnUpsZUEpKuSCmjCZs46h9tx0OjBRC9dTNrbU62i0AsG
         gPrBVcPZrMv1wK0q9XQFMvcyoQbOk/GiJEeNwnYERXRvkyIRZx/QmvsRJOeR43feoyh5
         2EZ1M6T1FE7bof7Gg6FDWog8VM/2yrHfGMDS5nNMFX8plsbZeessp5E/oNQZv+BX2LKI
         pdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650542; x=1795255342;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwFZMvB4uY9ceiCAZLjceweMYbxPpefUPYbylRB7SRs=;
        b=X2dgRZFe9gmydPG2SYo9nqfzFGyL8udoQI566VuHcxSk1ikIZyCofPPUv7Tp8Y295s
         faQlxsnFtifRkmcHNVH3qEKoN78l0EZ2zYeGDLjCbWl8XH7Rn7+QHOzvcl7w05cpXxv/
         b0pRuwzo616A2In2bPYstNtaXQslS6TQb/B+PZU5dvphHi/J8HQCJ+SWr4SZs/OH5Z4a
         54AiV+7neNJTlUl8B9Rv539/qWxAXs4HJX6e7mOf5qWs6nmxWzzqzvrbbbBk/SIKSy+r
         3xvnNTe4YPM4wX65sL4Cw9/dHOp3hFNZzEeMrmNcqvrdJTPhnVWsAmJyuZEf+uXYF5Uo
         XlGg==
X-Forwarded-Encrypted: i=1; AL+hErHdX9Ru04eSfUMtOC1VyjfFbhiCZKgeb1MyDmBtJ3qVwiW+dfXlxIvQknFnrCTHhtUe9ada+4tkT2yH/IDK@lists.linux.dev
X-Gm-Message-State: APuU4Z/uUAIcU2f1lwNMHCm2mY4aQpjeOVx58CT4pOUIWRVM2unfw+e/
	QHsy9q3HSiD65+4EFQnxHbiMiVV8qvwmlVn7hkYreoyHRPYlQ6ia1NKa
X-Gm-Gg: AYBFou1ET1tp7sT2tP+IRznrPBQj67VXbG0jWvjfczIOJndv5WYpQIDfxBci78ds7sQ
	wkHTp8K/U6dpUIM9Dq34NWzz8IMnrE1+iSU03eDw32qaXKm4L0WV34p9+Um1pfenRAvm2GfnXbp
	KyV2Eb6iWTaFaKfAMAyV7fzxUCrxkbekiTULLJzBnz6LGgzHdXdw2eQNylWHQb/9FlKNyntuCOw
	ASHVmyCq4cqqMOuAWHZPqhK3Wm7vSwLgmeIeIi5vKoKiubwQLsN4OZa5B/2GFSiVhTYos6bG7g0
	67UDMhz9VwfFjbwyDG12oy/0hXGaUnhGv0oi/PeO9Cl6lNoZevS+MOsrisUMR8ufoPvM8sVtwTm
	FmLiVOa/SDCDFE9TTOnDXKDc49DyIu5jJvT9crViSudlsOskFasDcreBtGBHuqLW+B9TgWtMXh+
	vGOScBnVEGFYJJsSnLMrItrxNuH+e3qsHwSwA5GB0FFnyT6Zf282Pf9MV2Lz5UETo6uQaHA9ob1
	EJnB5ewN4wSUEiUxkuehLvFu3zFEM5o5Wkwur6/OEQKRG6Vuz/LBiz7unKlG/0ioarmgHSzf+Fj
	U8suwRjwAIOFxkbaw71qVE25yHDPNtJhRYIlIVY5WZ1HS50xfLSVJsY=
X-Received: by 2002:a05:600c:515:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb55a6a658mr71519865e9.27.1794650542390;
        Sat, 14 Nov 2026 02:02:22 -0800 (PST)
Received: from DESKTOP-TMG47OE ([176.41.25.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm10520184f8f.43.2026.11.14.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:02:21 -0800 (PST)
From: =?UTF-8?q?Ali=20K=C3=B6se?= <shroot1337@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	rppt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: sm750fb: Replace set_DAC macro with a static function
Date: Sat, 14 Nov 2026 13:02:05 +0300
Message-ID: <20261114100207.9124-2-shroot1337@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114100207.9124-1-shroot1337@gmail.com>
References: <20261114100207.9124-1-shroot1337@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the set_DAC macro with a static function named set_dac().
The helper has only one caller, so keep it local to ddk750_display.c
and remove the macro from ddk750_power.h.

This provides parameter type checking and follows kernel naming
conventions without changing the register operation.

Signed-off-by: Ali Köse <shroot1337@gmail.com>
---
 drivers/staging/sm750fb/ddk750_display.c | 8 +++++++-
 drivers/staging/sm750fb/ddk750_power.h   | 5 -----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_display.c b/drivers/staging/sm750fb/ddk750_display.c
index 4e390541a507..d619e00fd88e 100644
--- a/drivers/staging/sm750fb/ddk750_display.c
+++ b/drivers/staging/sm750fb/ddk750_display.c
@@ -4,6 +4,12 @@
 #include "ddk750_display.h"
 #include "ddk750_power.h"
 
+static void set_dac(unsigned int off)
+{
+	poke32(MISC_CTRL,
+	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) | off);
+}
+
 static void set_display_control(int ctrl, int disp_state)
 {
 	/* state != 0 means turn on both timing & plane en_bit */
@@ -151,7 +157,7 @@ void ddk750_set_logical_disp_out(enum disp_output output)
 	}
 
 	if (output & DAC_USAGE)
-		set_DAC((output & DAC_MASK) >> DAC_OFFSET);
+		set_dac((output & DAC_MASK) >> DAC_OFFSET);
 
 	if (output & DPMS_USAGE)
 		ddk750_set_dpms((output & DPMS_MASK) >> DPMS_OFFSET);
diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 0c4ab2120385..61f8608e59de 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -9,11 +9,6 @@ enum dpms {
 	CRT_DPMS_OFF = 0x3,
 };
 
-#define set_DAC(off) {							\
-	poke32(MISC_CTRL,						\
-	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) | (off)); \
-}
-
 void ddk750_set_dpms(enum dpms state);
 void sm750_set_power_mode(unsigned int mode);
 void sm750_set_current_gate(unsigned int gate);
-- 
2.53.0

