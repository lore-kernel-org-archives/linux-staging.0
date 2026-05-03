Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B29321CC4F
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 00:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769882; cv=none; b=W0D0qzN7ThwO5D2sy01p+WlvMsvydhz9Xa2AALlT0boLFMdBKGgQ7YoGxS58EiJ/MovIHpQpobDt5oz/6g0AyBc8M4cpmy9si6xGA5gieEUP8Y++ROEp6V+XyFYQK1LYQw3p7DacbL053VOr5Mifk+ht3SLWiyiiLHv9yK/Uv0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769882; c=relaxed/simple;
	bh=8l/2o5zylQXoE/1w/gtZoDnAX+RxP4GET+H3d8jlJTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cP0tzssXUCdwk1zVN5aK2wGsgqWQBmThsfA/UADjLdaZIyQNUAki83j+ZKL9zEycXDCUF2b5zfJi+ZXmZtvxpMntHlz0m6agTjy8WrwLbnSu5Eks5/VU+2lhXh/vLmoxykc3LAGJdg3bvn3Qsu8RouS8pNmVfTGoU6AAgyyopV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=Kv5IngdQ; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="Kv5IngdQ"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-62dfe7edd84so182562137.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 17:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1777769878; x=1778374678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RPKlFjOFb11Zy9xuxXtoquBOJB8xFkgF1W3uRzdWgUk=;
        b=Kv5IngdQj6IKnFamOnJMgT1SfhKKWqQknKHVVTmNNQF9IQdANiKiAc5xLaLODiR0mv
         OuM2apDkhzrWLi++i8kzfWu5rPbObF1AJUuMH/W5bz/jvBYljXEtA8WiTNaKYxiUUTeg
         3xmgiFIr44D8ifZ7EfGo5pQGjpYUgOBaBs4oKOnqnrbDRsUMU7KomwZNSz13eiBUlqw3
         liEEkm8SkGvxavvmX8IjR9iB7on+rpzftHx1iOvoDK71M/LVrKKpOx21BKbUeC7xCaYM
         yoxdeqa0jX9ZXqRuTRP0Y4DG7+fr4N/k4/0CRTDeYr7mNhjeUBGgFwvGA8IwaBJBXgnJ
         jNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777769878; x=1778374678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPKlFjOFb11Zy9xuxXtoquBOJB8xFkgF1W3uRzdWgUk=;
        b=k1Py1W6UoeAar0SPL8HD7T6cSBY3svEMQrJPni3TB0rdZ0z7TnyuVM1M3hpcBbAyVl
         Zke8he/nNd6cozUWKeOHNuYewgyytbX7ZqDHteVWTNjKRH9x25q0QN6OO6zTwYIiOVcu
         rhA0fP3VdNP5W2vDPch2ALXEOmN/4n7+zAYWh9fKFOCCUpruAO9hanQKtWFhm95FwhOV
         rz3A4oIVDZbw5VAsbqhDKLizMbiGTJ3bE9Lq/+TwsQMyuBQZe82TZh1jSQoubJBj1wVb
         TPOxkEpIPQjd7OSgm9zZ27KuB8wv2a6Yey3jfBj1uBAvwVn7zUaXHmawoGW1NozOcJlW
         jKbw==
X-Gm-Message-State: AOJu0Yym2zLWB6qw6E5Z6EqZmuXmn1GVA22+pK0BQpX0y5wc3KamlDnT
	VbO5x4gZiA7B/XR0nwB9zQK6NaeYv8vVUpOdV+T+uRGCVpcfD6Dnq1F6nxkWklCNct4=
X-Gm-Gg: AeBDiesj2oKwMJgr3tP9B8ibfaONkSj6fSig8bvFXiCX5fwxPUGidOCqRhmcFc3CZvT
	TeVVHnxhAGqhnsE5GexC7xK7WUoQ6w+aboquZq5+cyPe9QtpmoJNWcge1FRD4a9wAAgQIRLnFqB
	swrDfP+ihA+Eqa3yrrFsHhu1nMte00x+cHaR+NKpZm3TDafTUKj4H7XiHjASao4YNK0sm0289Yl
	AxIagSMdfl/hoGkfu0M1yBy4BHn05PXkEfNEuWz0fdEd/5qLwTrhcj3UlnfzeASzWEnegjyDE6G
	2NThZ4ueBqesTACEMQMfkdVlrzgtc1sJd0BKqyV6uFPz/g9x7JbwLSoLA0qfNnMSpe7VgU8a4rr
	sZjfoq8G/pBg01Ne88Y4dEPJtG2W5jQKrhsqVB/DImMkWgEUMcSsCxGiFasHhhgcyEsN9v7pcpi
	if983JREDTW+7s1W6GDGJX9XcMvXpjkc8G0vU5yOAXZONXLComUc0s8z/NT/qy4XlZOgi0oZmo0
	vjIHsYIMIaoMkm5HMhprVv9/rAJPNlCsdFN/A==
X-Received: by 2002:a05:6102:4a97:b0:602:7a74:fbbe with SMTP id ada2fe7eead31-62d8547f4b4mr1866411137.9.1777769878264;
        Sat, 02 May 2026 17:57:58 -0700 (PDT)
Received: from localhost.localdomain ([95.214.114.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfd8b5aeesm3457671137.7.2026.05.02.17.57.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 02 May 2026 17:57:57 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary braces in sdio_intf.c
Date: Sat,  2 May 2026 19:57:54 -0500
Message-ID: <20260503005754.69012-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces around a single-statement block in the SDIO
disconnect path, as per kernel coding style guidelines.

This fixes the following checkpatch.pl warning:
  WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
v2: Resend as individual patch, not part of an unrelated series.
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..a86252ccac76 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.50.1 (Apple Git-155)

