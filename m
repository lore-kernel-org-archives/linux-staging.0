Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC45326928
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 10:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324452; cv=none; b=jklIFDzFYf9tcvGldmMkofXq58Yc1UuYZKMjQSRqXkzKgFqlXR8xWBfcVSXsNebPkM9VvN3Zbbj231pzF4LQU1WCuNKlt8fP5mB+V97Qqgwsc9W8N2+2zTFzThXFlTTyFh12c60+qATSnRvIUUQntYkiQmD72cfmiBLgaF7DnUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324452; c=relaxed/simple;
	bh=a58Qyz4yI1M7vsaFloBtxHKTIepBhu4y36YfXX5d6dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYrK3UKW4cx2PpXlUYfPh3eum+BVU/LCFE0LV3BaF/FSe3IJmoZqjdTx6miXc3HWsb6ZSW8iAqY15VKyTelyWu739Ksd0daFaNO1VpBXCnSxlTnvU4qYqlpQZk2cwfIrB7RN88lXgplLuI3QU4EcTKng31X2GTeZTA8fdv0ZpV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEWMFQuB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEWMFQuB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-436e87589e8so4959644f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 02:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771324449; x=1771929249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uC1qx3Ue6R2VTm4FeVYxx7McYYY/1mDqvzLvO7tDuY=;
        b=TEWMFQuBZVWloIxZzVBLIuYu9pJ2bhKMyv1xBnRH7NE9X67EQ6XIU6OhCGVufh0JmD
         eI+I5w2eEYlapa1qAonBDMU24OwY8C1fs86zbzrga4D56FgH9tPCXXQyhN/4HONLe8wT
         Hee1SsqP1OJjq5Jo9rz+YoXlm6ZXRSnWM/jTtIf3BAUJBelNO55+ChcXtw8KlQybisZW
         ZBHfxR+WQhSYYB+ixtTzDCwHgvoHnoyO6/Oy9MjJoOAVIA7nvBHJOmi6DmqZxPSBO/8B
         1bHfARKXOyzIqUuiQ9urCqpc4VdGmNLjxupFQSUJiZRB6Zzbbem6/p6hT6W9Eb02NUgE
         bVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324449; x=1771929249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uC1qx3Ue6R2VTm4FeVYxx7McYYY/1mDqvzLvO7tDuY=;
        b=So/jR8IytmEFuAkxWG7iRbnCLhllUilguFwEObsuvN/k9jl26XcHMzo8pSJwnGQvJc
         D0DudvE3V1WwVvblPh/My/yrEjII1L/1exQAGHSkeD6IIKDsS/SShSPTNA0WUWyq4KT3
         FGyz3WTWYX8S/kuKqNA66uVcrtINpqzAF+AEv340/4Sqak/EGV7BqwuZnrYGdLlpqRE0
         0kSzmTAr9fGSaiAcC32YBCJsF9O05yt8ZKx0UDXVHRjKrT7zFt/8XtJTj4rfDuON7bqo
         849ExxndzDKPeqzrhV62S8/jiDNHWOCQlVAiNtQuRK2UJnslGwa9TA5CuyGQaCBtXbxe
         7u8A==
X-Forwarded-Encrypted: i=1; AJvYcCWT+5K9a6NrcpTerxe1LNJzDEvqs3guAaeAXiQXbjESGpjDqFO9xTrhk9IY5Ir6XAftxYfs4xTfeEkpvk88@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Mpp/ozZL451QzBld3Z/hnbtz9dGmV2n0wMnUCP289HDWEOtW
	FPbKsv+v5lFOqAPCJDqUpNdfyfua4cerP7V4pjfOZAeNkbNJBHTagFsT
X-Gm-Gg: AZuq6aKSUHQM1Mw3ZgPhhkwAR3O9CVx5bNKpFN5kR5xy5XqXdIg0OrWZYwwqYId8HbG
	FYu69phoj7MJNSDtu3YdS8o75bxyxy4OMIoQOgsvMbG4KRQIdT5onr/CxzSn6LjDShn5Fx+xsZD
	6mVKBDlQnmSLEFPOs05bxN+AN6wBpcIOO4OKHYyv4+y5v8ZjlPkVkC016gc+o8COzNa4FAzKt4o
	ZAmB+G/MNyna1SaGYbK5Sqy5+SgtnEZnjQ5+Ere0WziY+fd948M8qnROfM8pQraZxH8c0mvdh4V
	tQd593q0z8nJfsRD+PnnFPPVpxRQRTT6+lb2qg5W5H/tkfQPu6KRyOT84qI/X41NAragzY9UuHv
	XKqlP7JVDe7wxLIYGEnosQ7AEJOwWW5kAHzhRk0gLCchuA5uz+eMOQyCxwx6U4Gplk29/mFV5w4
	hFAXxE/X7HwAh8nFHlJnyyR4HTfxKh6ygN9OFVWMBRBFyoHbFQJ5FD
X-Received: by 2002:a05:6000:200b:b0:435:8ff3:cd5d with SMTP id ffacd0b85a97d-43797913b9dmr26156388f8f.32.1771324448473;
        Tue, 17 Feb 2026 02:34:08 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm35407042f8f.0.2026.02.17.02.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:34:08 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use kzalloc_obj() instead of kzalloc()
Date: Tue, 17 Feb 2026 15:34:02 +0500
Message-ID: <20260217103402.4359-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kzalloc() using sizeof(*ptr) with kzalloc_obj() to improve
type safety. kzalloc_obj() ensures that the size allocated matches
the type of the pointer automatically, which prevents potential
mismatches if the pointer type is ever refactored.

This change cleans up a checkpatch.pl warning:
"Prefer kzalloc_obj over kzalloc with sizeof"

Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---

v2: Resending now that kzalloc_obj() is available in the tree.

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 22dc36e8e38a..8cb9a760f763 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1954,7 +1954,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	}
 
 	if (enqueue) {
-		pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
+		pcmd = kzalloc_obj(pcmd, GFP_KERNEL);
 		if (!pcmd) {
 			kfree(psetkeyparm);
 			res = _FAIL;  /* try again */
-- 
2.43.0

