Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D933FE
	for <linux-staging@lists.linux.dev>; Wed,  8 Jan 2025 00:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736296096; cv=none; b=VoULxLjxGSkCCaeSSv1VRcVve3OyshYx2nK3TwgRokB/onWroF2k1cb2z90piOXdOPwadgJj6bJsrMp3KhnfSXLNb9py0+I/oHWma3bGPdhXmFyTUitP6anDkxWIrzAj1hydLbFk5PzYWvdYOJHkgEt5DffXFW1jzH3nwrLkn2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736296096; c=relaxed/simple;
	bh=OoUElTdZ8noTRAhckRV3dWAEveTTzm/jDyiNY6COc44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qy1bd5uwJBU1OZFtnf3ePR48ooPQgEuwFwWbCQAG+RJn3cduvwywZ/AlsbTVAoaDrQuXcNKv45EqJyAO9W3jIbjoIO8L32/kFyUFzXF/LVHVHXMc2oL9o2facZXrH4JKS4y6vWBqrmQzqAWre9NKkE3Tn68NtWKaSp3ssNOtnpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0lHB62r; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0lHB62r"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467a3f1e667so95437931cf.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jan 2025 16:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736296094; x=1736900894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BkStnFSsN5v1RnDUUXv+quG4N/GvInU734NcFz/mG3w=;
        b=I0lHB62rWGwkaNUVQXLTmtQ/MfHhqPMTEDsRn6HLQ8mSvVt26kdRYZ+7dhsivv966q
         swdP3uJqUaatKllYoLSk0GUWqVHqqE6UB/bN4mgFvFHh3Pa0burH1BIzFcKledq0ing9
         WoHdfe6HykfJjZRSJL45U6ESWoPAwggxVukb55pW99xUt28lUD7SeQCzJxkPz1nEco9u
         +rVRbEr8eym6vFespEoqbFqs/Nhn/1UdW6xuNr0qdxHoUubbP+fUblZA3MpHHHJ449hG
         6HurhqziT61SLkUx1F7sHM0I6fwXM27V6TiwlOIiL6YGFJzoLcEu8wW2K60E9QChSv7z
         J5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736296094; x=1736900894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkStnFSsN5v1RnDUUXv+quG4N/GvInU734NcFz/mG3w=;
        b=cZgUJDOpOa5aBcrQlkd2an7FykvGZlKx81JS0Lx9pZIfeYOCw/LKvZRqN4aoKGWjKp
         lWfxvG9xYchci/fX/iSnjEQksP6rx7JPRlGpUUOtlUdwuC6wn5gv0APoQr/Afo9bjtzE
         fKcz/S5lPabv6qO5i8KbJkUn3WvbrkMNIThDjd2lvpRTiTNr+mU9ibaLOm38prlU9nB2
         vZLbI4tEVuOwZvX3mO4Z8K4zAjOlREqc0wchKS73ZhsSj+pHKnkRTOaMwdjRsYp/XPgn
         CC+hoMUazfdioCPHx5Rf+sv56OsRM/6FWPxb2cQrXM1txaZyYqkQxUpKAHuhBo6wWLL+
         0dIg==
X-Gm-Message-State: AOJu0YzR8mj5lEm9LcQi/OAdPbTADFhzVxO7eHoA7d5YWcjupmLbvP3A
	PBPvE8RXiqyTL51LA0L6XU7/Cm3EbcS6q4sD1LpVM+OHNoSH9QBC
X-Gm-Gg: ASbGncsFdbkjHldnVkqj2a9T6zOcDr8r6G8F29xAdenPLNJxIQRIzol8ss/cTc+uj0Q
	vBPEkm/rzD2Ww2dHtreWE8eimyAnSrY808KGTB07NUy26w2gGM2yeH49IlqfSIeXXs1ebi1s6mr
	CqJ5FGsnYKVXOLyGHv0wvymVR1tc5862jhPVF98NafO1OMnY0WCdIUlDd2vFu0crJJtUGP5FTwL
	HEdu6+kEoZXF/VfiR3MOlV6634IKukYvq55isSZqxh4G6NuziFWidA4SAzV
X-Google-Smtp-Source: AGHT+IGsbOSu+Ro8Z7PqaOX9gp2V3JF2QHv97fV3VwPsA+LnXJL8IPxu9fcZHDTvuP6SGDpIf0r9tw==
X-Received: by 2002:ac8:59c8:0:b0:467:73bf:e2ca with SMTP id d75a77b69052e-46c710f9bc5mr15728871cf.46.1736296094051;
        Tue, 07 Jan 2025 16:28:14 -0800 (PST)
Received: from localhost ([104.28.203.246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb5cacfsm190636291cf.89.2025.01.07.16.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 16:28:12 -0800 (PST)
From: Sandeep Salwan <salwansandeep5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sandeep Salwan <salwansandeep5@gmail.com>
Subject: [PATCH] staging: gpib: Convert // comments to kernel-style block comments
Date: Tue,  7 Jan 2025 19:27:57 -0500
Message-ID: <20250108002757.43896-1-salwansandeep5@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces several // single-line comments with multiline
block comments in agilent_82350b.c. According to kernel coding style
guidelines, we should prefer /* ... */ over // comments, especially
for multi-line or verbose text. This is purely code cleanup only.

Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 53006d0cc79c..3cd01613d067 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -31,8 +31,10 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 	int i, num_fifo_bytes;
 	//hardware doesn't support checking for end-of-string character when using fifo
 	if (tms_priv->eos_flags & REOS) {
-		//pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
-		// tms_priv->eos);
+		/*
+		 * pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
+		 * tms_priv->eos);
+		 */
 		return tms9914_read(board, tms_priv, buffer, length, end, bytes_read);
 	}
 
-- 
2.47.1

