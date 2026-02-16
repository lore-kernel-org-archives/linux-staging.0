Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B321B185
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 16:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258664; cv=none; b=he9oYV6FFED2x5HgORsZxMsFo3JThX6F2Ma3QEhIN0TipbgT2JJwYFUrMdttmDkERw9URpBO9omn976vZdgxwMkGpiqjZHj2UGbqTFZ5Tso+k27Op8jsrQwQYCOfQ5zaWZPF/vAiMWxUW/H+zK9fWLJ21A5nC2+KrK5WY176pzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258664; c=relaxed/simple;
	bh=GQHICsCzxJhBTgD02Mg8d7iDEyFeeUc1n/4ibtjOQOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inFR07dWRGpII4dIi2Iy+4vH+hoP+MuB4CB2KE71otN9Yzd0h3exxxkF/2HG7pcesSRXh8iqwUgeOvM6a/dkVzdjMJ2ZrMKo4Ot5H6+um2smHzdI+SdWU61N/Iy428+PqZYOFtUWLiZxGJRfCfHNkDOEjYQybNDLIDK/eu0+g54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6WwVkxP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6WwVkxP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so16907755e9.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 08:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771258662; x=1771863462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bfd/kt5e2880Ls0m0ghzhAGln0QVmfPwbvSgeuman58=;
        b=J6WwVkxPvWFXYGIw6dnckPV0sqPRjc6DMzkeW9kWgvpcF3xvXg16nY7rWDkKCXoBF7
         xynP2sJEwLDTC+wu26NXP4McVgO9hilzmALqQQLwQcs4o/POTfRJzwfNF0hpOp7UL5NC
         sLqSz1jnDgSQbKW776eNKjge9Y9ZkRX6VApjX211qJ7KyYLh9TpEl8pUGvFNBiVknUuB
         pye113dXoL4nHrV+5WpPv/5quwZgKpBxnoTj7bGGekHok6UZ9L541T5l+NeroaP32Hzk
         SHZbTkWuPqImjUw+b81LOGUG+7gdynlfkhQQH8Ss6I4YX5p+fXG8XBFEqqvSZMR8DdNF
         pw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258662; x=1771863462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bfd/kt5e2880Ls0m0ghzhAGln0QVmfPwbvSgeuman58=;
        b=OZMxGZyA3WUM6McHBj3XYV9+YOH01IrnxHrvdsiu1n2qQEm6Ich3Js6a5lguWfgmez
         I0JaD2IrLLitHf0a4VqYZuJ9VApUO89ffbcG7PDkdKLKKVDSC5d1NU5tcPJg/MLQxpO+
         TPhULmylV2mcgTKcuWgXHaCOe3U0eNcZ4Dj0roxiWaQ2rBwPd3QzU8SqY0+v3dbr9ytC
         k3JrDvYFEghWGPMQbHR7i/8jRoxtxsPkgTH0KxWehFVhSCZKRFc6Mq1V+OY584G4E98g
         ic4RPu4GUfOKlWe9yvnCe8+/Cg1sXUy4mJ78ry5qorLateYQwZoroh/pjuAO7dEtdR5T
         p6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsNKN1kuoTC8CX8P8NRv03XNCE6qmO8gny3GWWYId0kNMDinTJNvHBJVcuaMbqlEwxNTVZLON01p4aqICj@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Mzs3YhgS6MlXchlzUqeK0trfi+xaY8+6s8cC9pvj2HdA226d
	0uMkRRARcqnM2NVUDOoR8PVe6DiH7xPYmzFHyMayo2MQVZ14aS1tGrLCwBcSxg==
X-Gm-Gg: AZuq6aJaLurRFl/bZJJt9ifsiEnG6qZ3Pkbx547LzrcsdJtWgKyVTmziRUFcmOGe+/+
	BqXqxfztx3yUXQ/oYrYZJylFKU3W6UToVKG2NLI+M9rF2snQ7f3TRZuH+LI+9KJbkdxOWt/RWkh
	rc1PwhYpBnAeoET0HZCnEidnobRbSI65Lug0igBBx6qp6eEgWIvUS0Q0ndVmZ6Lv6mFD0wPdL7B
	FMwybF5pd+t8oR9rVT6QOYYD6lPKj8dSwyYf4wx5rsO4kY/gB3CaBKkfS0jK7nu95HguKrVHdII
	FTJ63vm5V2heftR0THxFub6+QDHROdMDvbd08LxKLhtLBYTjjdv55U620NNNoRtdDnnRQIji9Iu
	stIJsi4fg83W7LdC/w63ypWIpgtLVkLlAwQv+S6CFOJAYaoBr2/taSlywob08M+nUuDXNqrOdmK
	HuZW2IRhW/di+AVqan6wO25CTjGMAq64RJ/dq79fcvUE92gkf3KLkU
X-Received: by 2002:a05:600c:8288:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-48379bd7114mr145343745e9.21.1771258661741;
        Mon, 16 Feb 2026 08:17:41 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483719b8e71sm264133485e9.2.2026.02.16.08.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:17:41 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use kzalloc_obj() instead of kzalloc()
Date: Mon, 16 Feb 2026 21:17:33 +0500
Message-ID: <20260216161733.7704-1-mariyam.shahid135@gmail.com>
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

