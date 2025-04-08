Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26E6258CD0
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151842; cv=none; b=E5Xsr1nVXBZbwTi9kQpO9HFlWdxbvSj2W3DXbyt/hUTrqd5QBz2pvkMCt/RwNuxcdrzXk81JcOR5k5bJCJgTVQ+toUbeVI3E5CbAG7EPrD77Ni3ytVBrbAzDo4IYzcG4lJCMaLT1fq74B4YMO1U/tlf/uUuIabhhu5Jg/xEjDIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151842; c=relaxed/simple;
	bh=Kue1YlVh5HQ6MZ9KbyBy0zFILN9rzFtinUOFKsVUXPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAlIu4eeFlQpjAHnZOBX6BRJrZyWLfHIUovyCcR6TJeF+VMFHl3FKLfrNii6iMULvf5WY1MJOf4yyKkK8jYDef4ysPCXALsTBSlsx5gcuAe2Xf0FIzA+x+AiijQXYMVRQWwkdqBUA82mJAcsR9SBkfFSOjoAPEMx5LnW5dLdod4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=f9ZLGWkO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="f9ZLGWkO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227d6b530d8so55174935ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151840; x=1744756640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB2MgTLPOg3pPg2tpudFygtBvxmFhbXJLI5jNKtriLI=;
        b=f9ZLGWkO05+SjHQlNJvCqDvgcnK1dPT0lGu0pv5wCSVvwoQL3C7O5S6CTf0+CKqwZV
         A/stToyd+m/ujzn2TvhDetJ+V5QHjNsvgSYPr5D3oRBn+NBpI2MCPlJnvj2egIy4TYfU
         SCeq0OEwj/eLjfdwMas1dzf9u0upnZr7wwNUylbgvtXZmbfGW+23R22/7S74l3iMCH+L
         LxOIThMKErL1bE4oBux5OQgyEDHEOqynKb5pZgnHS1oaJqIDNZ7BfEEVs92Om1ErISb0
         7+UdMBsfromWIXi/+dVNF25rXBS6laPLogcm3b+R8Vf8tM2aVFmeXMdMlkzYXSuTbbRC
         DdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151840; x=1744756640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kB2MgTLPOg3pPg2tpudFygtBvxmFhbXJLI5jNKtriLI=;
        b=p/zEmJqMUoWuwQk9LjNsJmWBXSIteaM1W9KB4Xq6D4F/gqc0Vn12tkhmByALumws4X
         6DuuZOVPKziqlmOdyYZpk42ziX6j/c5Ez3BABadSwxw4vt5fVkRi62dRDSMM7QZ1Bi9D
         YdDOaj7d70auerMRYEdAc3Ry1PDA3TK7g/W7sk+m2vzVDDFIGlYM9dksZjFUMEV85pKn
         mvBqFFR5SdKhlIiNFFZhexR+eUd/nPDjHs/jjRg7B2eZz//fzXJzV0drChKvJC4WEVZT
         aVpWVNyWV89nstfnjOus7wWIRL66A91TzBS+Mkpiib9J7BWfUgwbEejsibd9AS94zGIs
         Utrw==
X-Forwarded-Encrypted: i=1; AJvYcCVPSvRvcCZ3WMMxP2ye3THr+ypebvR5auvST7fhmxvP/A9luO4SFI1wW8S3UTOzTCfB3XG9nuhbH+DnW9bS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl3phY0k3fgqGHISJ2Rt2MQbvvstEZ/tvoZNEscGUqkyRrMHRg
	1z10YNGiNw2q/Nr+zpRR+1QXmz8sFkyxqj/I7WBkytGiJFZFNAMDzPBhjTJONg==
X-Gm-Gg: ASbGnct0boaO85VmTX7iDzpQxT4Wvbs1HNMMMB6d4+v5fuM503nHH/doyQqUU6auzeu
	S+qscAsOxDOjap/7ucA3cncCgpUGVsDlFGl4mclTKuo8NY2hP5CDxrzrt3KKDD7cGqvp+dwkC32
	tP0lkMw0KpMb0fSoHA2rPX5DoOnt5CHNAaVpT6zDiwsAZnzmH8oBtnZT0eygfTd8f/oG+w8whXi
	uIfsrTWa4vxurUOkKqMAtQUWUGi5kWEO8mhYle3VNIiMOIBcD9bfaGvxur/mHar2qWUXk5XY4t9
	CWDNljMZSG/I4gcRfRPnY9ftxCn+PxLgB+n85rYnYmLxvJu/1mVxGcTJUQd2ZEcKJDPw5jBZl9k
	vubWwfiT9xg==
X-Google-Smtp-Source: AGHT+IF/LhpWwMnphsjseFvk30r3OAklQBg0/w4MfdfcQxpCTgbt/coJs3EOaBBq1W77mCq/aWFuVA==
X-Received: by 2002:a17:902:f60c:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22ac29ad1b1mr12606075ad.23.1744151840150;
        Tue, 08 Apr 2025 15:37:20 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785adaf9sm106830845ad.27.2025.04.08.15.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 15/18] staging: gpib: ni_usb: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:55 +0000
Message-ID: <20250408223659.187109-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 715848a3bb75..93975cd7e5b6 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2198,14 +2198,14 @@ static int ni_usb_hs_plus_extra_init(struct ni_usb_priv *ni_priv)
 }
 
 static inline int ni_usb_device_match(struct usb_interface *interface,
-				      const gpib_board_config_t *config)
+				      const struct gpib_board_config *config)
 {
 	if (gpib_match_device_path(&interface->dev, config->device_path) == 0)
 		return 0;
 	return 1;
 }
 
-static int ni_usb_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_usb_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int retval;
 	int i, index;
-- 
2.43.0

