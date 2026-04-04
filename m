Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7B126560B
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775264406; cv=none; b=cHRSDUBnmM9okGOZlev1eHMKn8kxB373qjC9+1KMwQpNtRnRBd1nm0dU9Z741QkZvoNCCKp1I8Ywh/QORgK3pElzcyzUnG5vxgSObA4zXRmEXKwfcMZjL2keOBk3Y9m31/hBbXtJhTmIpvLS6ROcB53vI6mr/o4MQzA0JrLnjgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775264406; c=relaxed/simple;
	bh=Skmw4ylMGydoe7gEcPewDeAa6HHn2n+Zf92PsquP3sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYyOqHcCe3HnbXYemtdhpBd6BT36nR6MTb8ybva6zxbeCPMkeYGbzJoyLk0lmaTsRqdksTgCTUiKbzyDxgTf9GAMGMjAOi26JalPc2rjfFr9w8K6Nf6JUPsbRI003U5VVfx9l5Ff6Dx3q/bLHin8jnLLezwyr9NT1EYBwAbC4Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcxEa397; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcxEa397"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-827270d50d4so2147310b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 18:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775264405; x=1775869205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdu78WEBDthjS8bCUBN2NaYBaupX0mXYCBE2SceYhTE=;
        b=GcxEa397NjQlUsqPIA2bda9gHV2z2VUWN4vD34dNyXpG1uX3l00rfgfvgV7p0NWYsv
         JycQ4yp2n+y+QXN91n/9DKGxsNL2XoZsvoXbQee72wVKSyDhYV60h+ztN4f4VoheP/yb
         GsQ7bNkYRsk2vdNX6dMeoRC3HWe9rL7z8GLe96OytfztgX6ebd+rJ4fBZy6BzCR9FY8l
         4DFJgQgXI7skbFOBWjt3MPTIiTT/m8IZp4r42kIuW/cIp0qSEZT0oCBYWaHRe7agzf74
         LLGmDeKskyD/JaVw/C30R7KQUSSKSLsFkZ8FCHXrbSLMCeAzKfGADSMITgPqoPqEgGux
         BhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775264405; x=1775869205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pdu78WEBDthjS8bCUBN2NaYBaupX0mXYCBE2SceYhTE=;
        b=ZasE1hBx0Qwu+4DuN7604cHZ8PrRblnGspda/ZYDbi7nnJOqbQEfXYxkL426yDbZON
         Hz4CFVEP1ojohe6mLLSOR0x+m2ht11n7NfCkDWD7tXvhi1GG4sK65i2snEi6L4efGsmX
         3DGRpvrMg6Itm/XKWVbntv3hXPdlcSUwT8TcTUeCao329+CAAOjPPjI/QfEXHjJiVLyN
         MSlQ77tRWowk+YahK+hGsqiARXbjGAQFRgi79+ySwOrfOIYJd2l1inQOBcAVXSIfjFfp
         FDe/hKB2/krtBX+ZD3XXiOJdp7F9m0bnKFxwIgiTdT1Fk59cOQZBXWQ3B9/oAIHT8Fj7
         kW0w==
X-Forwarded-Encrypted: i=1; AJvYcCUJmzfYXbizCuwT9I7PWUbOZ9JaVT4djKneVxlTRTyV2OKAIJ3hbyS7w9ujojWGYulmhpXpnNIkkBgAOXaL@lists.linux.dev
X-Gm-Message-State: AOJu0Yz71ONBd/Qcxc6FhRkT0mNmYFxmSV79DUtx8JT6stWeHtFTgkmT
	wlChJUnlV9EppqY2k/QzRptvq2oqmcz6foUgtq4JwXg9qEiREvPAas7j
X-Gm-Gg: AeBDiesAx3qwXtIr0HtvTfjPmbdgudWgfO6putVTGL3EzvORAuFsRPd2pAgv/LyqU7O
	NbPzestWkqBZzppcAPt0A2pz6f8ZuPQwude4V+NooS5C1Ov+0X3/DtYRuO4iCdLK1GT16tEJ1Fw
	DLLvdBSS90Ur0S34Ib60wFp+ZZsDY7c2xuj+u2utz5ZT65BY54FK497BNGPjflth+rmA0zvewnH
	/MfYgeevuVIw5/Bg2NHRTvpWx6r3k/e/4Omq7f4z3e/U1NvOssgHWF4TMxvslEGhKaRS0SwfNV6
	J77h+on8eXt5AeUNn+IxGFvU2EBtuLwW79tU8EfcMny6fOvotRjlG58FXFB/IQOMxKS1HjuQYiE
	sSrZAEQlU/14mUmddn+4PZMoAfyRXRqKCnP9YZX+jNGELDdBK1nPTOoMlHkiU/rEm8zx/ie4gW5
	9TjNH7vNsw1cTHCucSeBQV8/Smpt2kar2X9mH7tZ6N7WcXRYTVp8zEVkR3H1h6QdJoeQkfus5IN
	9A=
X-Received: by 2002:a05:6a00:4b53:b0:827:3222:c4c with SMTP id d2e1a72fcca58-82d0dba3201mr4297536b3a.39.1775264405006;
        Fri, 03 Apr 2026 18:00:05 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:7de6:bf03:20c5:a0a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3aaeesm7565306b3a.13.2026.04.03.18.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 18:00:04 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	k.souta0926@gmail.com
Subject: [PATCH v3 1/2] staging: greybus: fix unsigned long long type warning
Date: Sat,  4 Apr 2026 09:59:37 +0900
Message-ID: <20260404005939.116701-2-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404005939.116701-1-k.souta0926@gmail.com>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260404005939.116701-1-k.souta0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning "Prefer 'unsigned long long' over
'unsigned long long int'". This cleans up the code style in
authenticate.c.

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138a5..0ef88b7d24de02 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
-- 
2.43.0

