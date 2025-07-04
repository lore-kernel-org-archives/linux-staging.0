Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171CA299954
	for <linux-staging@lists.linux.dev>; Fri,  4 Jul 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642871; cv=none; b=CEF3w6ZKftYQxqnTygGQkRBhbdJD9aN/ZK7/9LKCvPrAMULJHtgxZJSDp1+s/3XuGyy3B45jKN3iJYLZEFMe3/zHkrhneIFffeNqB4o20DiEasmwVyUtFfNVjZOVwaXHhvv0ZEpKZzMcjDimHA/B7tyCTPp6s+7EoO5zc+xik30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642871; c=relaxed/simple;
	bh=4v3TRQ4gYwnhEwc5GUKsBPODNNDA4dpVHy1PtRhstxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oeeGjSUHIFcL1K4MC/ylWFXs2toBCx8fA1MPaU4lLE6HQT7g1xLcqDTCJct8TBDfCcZet44R8BbqUuH5lG63Id9CiRE86tS7BB1EOe0hC5S09rxE3O/mxjC+Hb3WkbwpSxcxpWer1Qfa17hw/+brqz3iBrZhNrJKvFHHeMhav8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXY3QwCG; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXY3QwCG"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae34f589193so20219566b.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Jul 2025 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642868; x=1752247668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+ebNQOqTu5W6nuPcdddqE5wsc9kXNQZiBU7TM8ffBE=;
        b=hXY3QwCG0co6UmkuaOe7CcebwXZhCMPE3He1c1xJSzxWqE9aATl8WZfyw9pKVkmRsm
         pi3uaFAVflNMGxyXp39sOpQ8p6JzPDuHNhPgFUTjsjkzOZNLoxXGZtx0m4XQItJngg3j
         dsn4efy4ysutlN414BRcy0FiwL1VndmE5hZncAiFIb0r5psMALcFgXPLbxn+6Tg3ZjSP
         9lgGJnGR3cZAwPk4h2iJIJiLgVK9V8WFMU+PJWYzIvL4hVBdFhAUkXVb+dy+SZYC6S2p
         FLuuGGFNX4EB6TWJRtuvl7PBgwQ60GybaQQ83EZ1WFbIxTN9xjyywHLY3RaNGNiZWOjE
         gzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642868; x=1752247668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+ebNQOqTu5W6nuPcdddqE5wsc9kXNQZiBU7TM8ffBE=;
        b=Tc+J2RKmDCO1414ipv+wy+qNwuGOSVKUTuwsFqEvuJwZtmNfUPR4KpTLBEeY88kYsO
         VMrNuU+kVo8tbrxdvwffVj2c6ujLjYIIeYxPubukiz/VzPbOgv2dvOKl4ve2iqR6PeR5
         sCLg54S5O7QbH1IuWwk1CeySyhgpmN8da2I91WBgopkPl6E9cB/gEd+OvadgRBAlpLPF
         5zS0pIbczG50dBdbPceDKOL6TDCfR6sFJjJFYTzECQrQUmiy7kLaPZmZs1geFCW0WUky
         Gm1GMib8SXMa4ZY471VXE/lZ0cteI+k1DsFlPxmQ09raXBjcgyV6kbc+zLjF2lVCP11R
         fFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNoYTZmsZPTFvoix5cJJiMG+0prhwq2HEVTExubgMFu5Y2boXOgmSTB2aG3zsvcaY+UN/fqZQHOi6K7334@lists.linux.dev
X-Gm-Message-State: AOJu0YzXCl29zqJz6rLNwjNVVanPSCv1LyRxyIdggDRpbtTqWpr69fGt
	+qTdLKEXcS2eaj3vMCd9R4Kio/s+ZknxZfygwJlPUL6eadR7wQHJwy4h
X-Gm-Gg: ASbGncvXnRJbAMg3+aGLSwEqB0NnINzHz0QPDNHgcaMD2Tg0xZEoxEm46OAHJAfsiGA
	FoYUZSoDEh6OhEYMEeomu6lY74msz14QuvNzBkmOVTwGDkvQLU4ABbc5hdA3Oht40c16tVleEO/
	pomdxm/FsdsiGLGI63lfHnqxHW815m6VBWCFAAaQE5/5dKqToVaMd+LRebTeB6xOUfyaRBpADkE
	ZtFbKElTg2PAKBHZh7PqymqKGHeWspuQnSLeQwmVnvTsD+c/GPIFymA1zoXUaN9MB5lMvc2dVkH
	YntFJJgR/nVYOJR1s/riisOzAOybsWTKQymicWYSM26QyLdGjg==
X-Google-Smtp-Source: AGHT+IF6oLHogNvjH3Oz67SB2byAsyBihuBG/+HbpIQjbMscOU/bzY+tofufIUk1WNXeICSLqYmeug==
X-Received: by 2002:a17:907:3daa:b0:ae3:cd73:efb9 with SMTP id a640c23a62f3a-ae3fc212ea3mr109904766b.12.1751642868054;
        Fri, 04 Jul 2025 08:27:48 -0700 (PDT)
Received: from fridge ([46.2.120.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5feasm190894866b.107.2025.07.04.08.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:27:47 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	marvin24@gmx.de,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH] staging: nvec: silence macro argument warnings in NVEC_PHD()
Date: Fri,  4 Jul 2025 18:27:37 +0300
Message-ID: <20250704152737.14315-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl warns that the NVEC_PHD macro defines unused arguments.
Use (void) casts to prevent unused argument warnings when the macro is disabled.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 575233fa1677..38e736b3761e 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -28,7 +28,11 @@
 	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
 			16, 1, buf, len, false)
 #else
-#define NVEC_PHD(str, buf, len) do { } while (0)
+#define NVEC_PHD(str, buf, len) do { \
+	(void)(str); \
+	(void)(buf); \
+	(void)(len); \
+} while (0)
 #endif
 
 enum ps2_subcmds {
-- 
2.50.0

