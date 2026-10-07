Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1541349504B
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364463; cv=none; b=NpGjmVPdsMUNvjjD0xuUJV3axnPrGHZiUqpNQG5i+NvQD2puHvTYqbaYnM7FcK5QUYoKTNp2TZbTSRu2++5/5uRNISbkSwREM4+kEgXSfrJPmVnQOCrNSfnVMaugJUZ1mpKsuLgH1ONInPksRu+IosNKGaLACq/94UK2+Wiw3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364463; c=relaxed/simple;
	bh=6RJ9482rKNjR6yltvjYFmB9//6oUoR7JNtNpyrstTc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gc859dvWSpMZZ43wqPlD2VC/ivaAKQYmCZnlbixNoym4lnDcoRU6Z0Vp6vEWiT0R+OMIkXdmFCnywOiV5Izr6i91T/cw0MuMYOEVcNXa3jK9poMwzAA6dbfoJzhxnDqNQMrkBELyuaN+T3KKlxIrt+FlFt7GMbVokI6l+QcmEU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuJGse0U; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuJGse0U"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-351634055f7so251886eec.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364296; x=1791969096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pVw0aa995nfgwPwgbdZc1nogZFK1e4jUFzuXB8l3Hp4=;
        b=RuJGse0UTGLqAOHU6km6Zj7ShzGxk+vHPg5hYdCt3HsCMFo8lStZatJOZG2O9aNzf0
         LpcsOOj4/CzyMsjlBCP4tY5fZzqFG5kGW/bLLIJUoqIOttXWHkZorM3VWLPpAEDQTAvM
         qaVX5R9t+qcLLsnqD+60X35YFi+R1oz5QXFlsuB+FGsth1c5r4xVCQcM5aPExV+plKfI
         86cQaJ+mKO5W1lMU4VHb2ZXCB0aIARUzmtGSKZB8lNV8rCvedpteKH+WsocSh6xkvmb+
         O/CsjQyroHM48SB660vO+961I0MjmsKCUJJ8CiW7qt9SX6MNYvZnu/nOYygoFsB7KxRG
         fDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364296; x=1791969096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVw0aa995nfgwPwgbdZc1nogZFK1e4jUFzuXB8l3Hp4=;
        b=e7byFTgp1MnuxXsUKhqy0azZ0CE328BMfnu/9Ctb3DMIr6BTPyDFnWZdlZljKJKXwp
         tYW5AEmd/+maE6YTzhfS012g1HJF7Cf9D6CPMPtvvaPmGA2JdvGm2oWG/LWAfjKmbdpj
         YdO/xbd6SIAT74DdS3CePR7LqRFWii9hwqAmsfbHOso4PwAO8XiU8hk4YesIBPVadVpW
         GENwpmkygyJhG10HOwh52lVxZOn+FJYEPtKERI+8lyozEFrJvbp2cmXtrHAo4oV/pyKx
         +Cm4Xg8wuQ73uqsLZwHWLOKbFw+3tmz+CD4puWY//JoTzEcaoVB6F4YAhSwiqA+2F2WA
         8nIw==
X-Forwarded-Encrypted: i=1; AKwUvByjKRCt9E2/OFIRdL9CTzgdoedyoIMAN5siMOq/Uv3wJNxj5/1M+Nx8JHnsasNAWWY1SGnMPQZZlLoQDNL+@lists.linux.dev
X-Gm-Message-State: AFq9FYIlP6k0o1u306wpaQAF9FGX20RnJ/hArea3fYwPDcilb5NVGojs
	givZB4/OtRyzTi1NB0U7bmEKkMMfb4sDPZwfN055z3Jpur9e30mu+MRY
X-Gm-Gg: AYBFou0tu9XGtR35sB5Lw7mySVNRNwb0x1EHfKmIXQVHHm75QFSd/2GiDM59JfBlQqx
	9etew9QtCL7+2ziQeU8xoLsxsKF0gVB8A6F84fJ3C1PHA6yRlq3yYbbOM6dRyOqRYmw9PrdhuCU
	biBOy1KLqCageeEFzOijfTk6TK1lI9vPrZy24VwomnoijJsyuWTuF2RCzkIabx9IqN3ZcAb4x3w
	Mn3bR2xEjl5HpzkrLvZLz821FBjXi+2BGoLH2GmHrBtNZ2BX4Mp0+k4YjGrN3KXJ3H8XTPlIPL7
	FxnjpFa5wZRmyuKr6cRdpPckUj2jRklBTsiJmSDLhTLxpCRdTywTOlkn98kRFXPWakSJN/IZsrM
	6Y/tpscca/ZWH9+ytzm7+oGNXMpzuf0mG01f9Zi1y4atszg9pmTYZFxvPsyjyOiiJpQF42d3ETE
	qJ+1QeLbufxLEVtHQrh1CC28LRHoXy7Kr3KVQPjhIGapkSNqEl+W5eydBL/qClwP+kE/vqbS833
	/BsqvfCSBmQuMoMrx0=
X-Received: by 2002:a05:7300:ed14:b0:351:694d:9ca1 with SMTP id 5a478bee46e88-351694dcc07mr372391eec.27.1791364295776;
        Wed, 07 Oct 2026 02:11:35 -0700 (PDT)
Received: from Hruday.lan ([2409:40f2:1168:fe18:f738:9eca:7e0f:4b32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c00sm6459394eec.8.2026.10.07.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:11:35 -0700 (PDT)
From: Rahul Rao <shreeramrahul94@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rahul Rao <shreeramrahul94@gmail.com>
Subject: [PATCH] staging: greybus: audio: do not use iterator after list loop
Date: Wed,  7 Oct 2026 14:41:04 +0530
Message-ID: <20261007091104.15366-1-shreeramrahul94@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the list iterator variable outside the loop breaks iterator scope
semantics and can result in invalid memory access if the loop completes
without finding a match.

Introduce a dedicated iterator variable 'iter' for traversing
codec->module_list and assign it to 'module' only upon finding a match.

Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 6daa4e706792..f4c3090684bf 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -395,7 +395,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 	u8 sig_bits, channels;
 	u32 format, rate;
-	struct gbaudio_module_info *module;
+	struct gbaudio_module_info *module = NULL, *iter;
 	struct gbaudio_data_connection *data;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
@@ -437,10 +437,12 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	format = GB_AUDIO_PCM_FMT_S16_LE;
 
 	/* find the data connection */
-	list_for_each_entry(module, &codec->module_list, list) {
-		data = find_data(module, dai->id);
-		if (data)
+	list_for_each_entry(iter, &codec->module_list, list) {
+		data = find_data(iter, dai->id);
+		if (data) {
+			module = iter;
 			break;
+		}
 	}
 
 	if (!data) {
-- 
2.43.0

