Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC14377015
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 18:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127742; cv=none; b=iE1Z+46C8XirtQLZkgp56+etvvIJCyTpQW+p83eFXoD+KqW6tEKi+XbX0Vyc+PNxS1WZn56UyClEHOE9LF5O+1brpylJAgIjj0RbNXhwOPU39uAgP60rPeGlCUIo85+X32IOr0x+tcaB02X5ltsdtPV9KZLMeixvqKZFWEhk2oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127742; c=relaxed/simple;
	bh=VkHbva5W99Uv3RRqgpizsgyvAOc+Mc0RUY1poJKh+gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Roqi6AYqFJBahyTSoB8HFdaDCAx2WxJcNZHrAcvRmOgeHVOhAE3xRJNHpdfIr8L8ygwtLKhT2+FcsGqggphTJ20Wa2B+esMTn83T6BqRVzphVWVvIV3gFUOpkAUtaXTL33o9U1Q5tPLPeSbcKH5lBKQngaSB2rhcwRHd1G4aQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlIg8tkZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlIg8tkZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cee9b74ee1so32448495ad.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 11:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127741; x=1786732541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKveWy+y6pUgTVKmIL9d8hPlJnPWCasWboYBiG5h69M=;
        b=WlIg8tkZ313QeBpqYYE85hcdQhTIx1A94xyzt+oT9luL7KgqmIq27pNgfcZWGU7gCq
         PtG82DXVAdPHpys9UKPK0aDcMkax9u8dx9b2C85cAwRJcEd43ST4g8LXzxQZtymMm2Vo
         uIFpYNP8RisWqPyNz2hhNpbwSA7t8UlxsK6VTERDFyGliQuRspvQpfl0wbVixXHq1Z6/
         IUPUY+Wrx12HzqgxzE4G+xzFPdkF7xfhEHmcDZM4tXxchmh4hjBIQUwNifflizTuOI2O
         CNt8GpeYfIlPvvkjdz1fXmSmH4KmliPHS2UWJ8BMfIr4amIiq5+o+dVHTBnfDSGwVrC7
         ZUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127741; x=1786732541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKveWy+y6pUgTVKmIL9d8hPlJnPWCasWboYBiG5h69M=;
        b=dOJ0Wj2JgKKewCCTbDO1kXK6RfOkhRqcHfAgYYF996gRgHqmbNvqopJh3e9J6U9cjo
         NSt9sFtKGS5hTYPnPQ3FMeZfYuBzSmGA+wlOQTREwvbRWjr87cgrilUN/L4HQL4cHN5K
         DT8snV78zM09SgdTIGSyt1bGsczJ0mOhK0h4cHQIwwEa0sjSfIqVWfb6Y8johMjE4AuQ
         tFMN4pAi8gvfptDQRhaUjB+h+zGMcuRSNxrLYlF2FFiaoD48Tc5/kBZMsTg3GjobOzHk
         GOhcAAca5+pjSt3JkdcoQGidZoLa/IZbm6KlcvcXul1cvrdus4F29S6u9LwyXOsUjKMD
         Rxpg==
X-Forwarded-Encrypted: i=1; AHgh+RpO3Mv/7kwGL1qebJDn0osW6S6IxeSdfV1BxpqxQffncD7fD9FpWen797MaYWGM53+nyOF+21UC1vfnxsQq@lists.linux.dev
X-Gm-Message-State: AOJu0YyzbOkLQTI58wek8vGupUt6u6oE5vvurwwvEu2Ehiz31Fu99Ezc
	tOqLGi/2x9Ze9vLlnJ+ki/Gw1+qfyWyq/gicedKmSpCiwZqt/zkJv5uG
X-Gm-Gg: AR+sD12k/Jz2EH/WXVoOMFjtX9J6VSWadyl5nCOu9c6DArG6V/XjgqvwGQ6JHZL01lc
	ealGobb6fICf1WPtSrfmEHjgaB9BtZecXF8e+qCnTTT8wpiMx2mnTojYq3agvSLtPa1PcGPL5gu
	t8JxrmaQXWhw9azJHIAwvbMStUl7WmPll9jVVfN+eFMAY/dTAq6dO0gpCJca0q5E9iCnftcvpAt
	YSS1fDYTzxXkwtqDl7rOdHnfQ29STLm2ANeJcI+wn/mTgd40YiRIB80BogOJF7abs/PuiCYcel6
	FkBbyF3oxWCK+HMZTkEBA0m5WEuEbjB/smTHxycDwd28IufN+dbqkAjMDeSqbPqU2QoJlQlizXU
	QCirwCSbpblZoCYjiHLGzKZYIRfyOl4JdGYuALLhdgFtqjNcaNAGcUQsTdGDhxaZ8kIfoOjMMwL
	qmJqIOLzaPouHExsvex2poIkcgvbVT+tadfaXU5Kkr1NHn+isOdPc65mRsNwrdFzs8qzB4Y19v7
	A+MPqqUdsofTypBTkE1OJ+ZWb5Fkg==
X-Received: by 2002:a17:902:da82:b0:2cf:7bfe:6043 with SMTP id d9443c01a7336-2d0ca949b71mr225134925ad.19.1786127740572;
        Fri, 07 Aug 2026 11:35:40 -0700 (PDT)
Received: from localhost ([2401:4900:1c70:5a7c:d1d2:a457:c3e3:35a1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm11483405eec.25.2026.08.07.11.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:35:40 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: error27@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH v2 2/2] staging: media: av7110: fix sp8870 initialization failure state
Date: Sat,  8 Aug 2026 00:04:43 +0530
Message-ID: <20260807183443.13912-2-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807183443.13912-1-punnaysharma805@gmail.com>
References: <20260807183443.13912-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SP8870 DVB frontend driver prematurely flags the device as
initialized at the very beginning of the sp8870_init() routine, prior
to requesting the firmware (dvb-fe-sp8870.fw) and executing the I2C
upload sequence.

If request_firmware() times out or sp8870_firmware_upload() encounters
an I2C bus error, the function aborts and returns -EIO. However,
because `state->initialised` is already set to 1, all subsequent
invocations of `fe->ops.init()` by the DVB core will immediately return
0 (success) without attempting to load the firmware again. This leaves
the demodulator microcontroller halted and the frontend permanently dead
until the module is forcibly reloaded.

Relocate the `state->initialised = 1` assignment to the end of
sp8870_init(), ensuring the flag is only set after the firmware is
successfully uploaded and the system controller is actually restarted.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 77bebf2c7..be62933ce 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -315,7 +315,6 @@ static int sp8870_init(struct dvb_frontend *fe)
 	sp8870_wake_up(state);
 	if (state->initialised)
 		return 0;
-	state->initialised = 1;
 
 	dprintk("initialising frontend...\n");
 
@@ -353,6 +352,8 @@ static int sp8870_init(struct dvb_frontend *fe)
 	sp8870_writereg(state, 0x0D00, 0x010);
 	sp8870_writereg(state, 0x0D01, 0x000);
 
+	state->initialised = 1;
+
 	return 0;
 }
 
-- 
2.55.0

