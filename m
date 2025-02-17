Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2686A15278E
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786739; cv=none; b=LYc2fmhWHj5hWL2ccSyaevtqeLCdBf1Wimc7lU5bcBiS0I4R+hINugF1TZ9nnC71DUCKszImsSF7J4BX22UVci9aVyaL8Qc9NadAzZkJk5+Z9jLpbaMmrkWbGDDg6zLozj/GwszJ3r958J738rfo4e1XOsa9SxGPdv3lamRJqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786739; c=relaxed/simple;
	bh=3jgBOSa3D+X0g/hAdlexzK+wA0bCemdDQBe6UWljxoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bFBwx7RUVtv1VCN/5OBhm3Gc9Q0IZeiRdfC18cx2oz9sk3gGsUtlABQBEVCN+GDOXDaVIvSq530xJ4+cQgsGDHJsjXK5XBn2NYL0olfL2hcVPdL+B7PDOUHUZ6ERKNFJhERZEOhPC5DSaKEqEGzB3V1xbHlxB/RhW0FlJ3dNpos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtAcfMuC; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtAcfMuC"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-221057b6ac4so26169535ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739786737; x=1740391537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=har9C3q0z1JARfPuvDnkQ85Yn9EDW13OUXY77oUlYjc=;
        b=UtAcfMuCPe5MXDiCQmHJ/ZXbSSvmI+i8+5ng4L/JRy5S7WGmSBS2oKDhfWpj1yXa5b
         6TO9SpS1eTu6EnVLD7Yt9WDDiwRVDGnsGuvuAJLzfOD7f1/yvGoTpiyZTk6/LmbrEejl
         umjC3Q6vyK7hQIq6a7x95ZaKFsxVf233W1jpQ+jRza7LU9Qszv7ihAO0Euphth7QslD+
         79ykrWc+j3iH9iTi3UYqaeHnSUWWhgXFvuo/OwnJPOGSwKemtn+M9tA5QCY8cYCVDlgu
         YlKtHSFT7vaHcOlwLZQMUgiFXiXTknhVFpGzLg1EIGXa3Snxs4f3gI7eZ7SL3wQumRSh
         ClkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786737; x=1740391537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=har9C3q0z1JARfPuvDnkQ85Yn9EDW13OUXY77oUlYjc=;
        b=qvzjM1hP0sGa3QCm4ZM+DBjknrNpQkxBPz16is9nPDp14sdzA8ngitWkroVbj+jO32
         CgdC/253OljF1y7Brwr6/FIRwT9msYufrMIBxL0eWvYZocFGCdm7oZwu6I3sgF0N+G+L
         6fUlCWvNWmimDULlcLAzju0gp6iLkf2z7JneNyT5yOmSUbLLKSbh4YAZie1ZvjbSo/6w
         AeM3eVHFo5X4ewuBkpvuIUdVMaq5+1MAwkOVZ47CiuQE8TFhUJxoPgUuKc+4dc6Zl+r3
         h42SVfscChDv7Cm08gVDpOpO7NTZ96BldYFS+ywrbybwBzZ943oxNa+x6JJfbIqWrX+N
         hygQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCfw3VYCxbqaQaLaLcllx7GInOUkelNBw5ZUj5NR2eynqPV0h+elSzbJ5jeTujPZIrTYwt4zyyiiysC8gD@lists.linux.dev
X-Gm-Message-State: AOJu0YwaN3Whz/6oWW30XBTNr0DBqFPkFqpPf3DV21gRD4JMTLqtuZgG
	fJEfTLK/jvxg/Boa6Xsz/Csj6eYmxpgE590Fvvu+Ac+VghaZm5sr
X-Gm-Gg: ASbGncuLOXo1YM1zqoB9xlKHg5//gnTRuiaOck6NgjGRuvdyw9zxGZhCQd+eqoxiU9v
	EpkLkvHV6+iyo5cOJG9QoSme730OsoPYvJztca5B765RhEfOUMBukjnXa+53lMxtpaSTraxTHQ1
	ELjblhwxbOY5NocXQEMYUfSLfUvvg2nTWZbxJKByeDGQaspgkdQJPM3u6WkFJIg1JFV1RI8WKXb
	fsEicHIhxXfVd1YrkUms8JsRXOmklq40bP6oxdX9EDo0R15EdFbw55KPSQQcqlINzlNVPdZ7cMi
	SugHMoPeIFsPTudFKlgR
X-Google-Smtp-Source: AGHT+IGU0+B1gfHA4wYrcfYnjnFpOKwnU9J+GSI5umSPco+CyZ7+Mefz0snJ8m0beCN0Mpz9nRU0ig==
X-Received: by 2002:a17:902:f54e:b0:220:c63b:d93c with SMTP id d9443c01a7336-221040d75a0mr156557235ad.44.1739786737260;
        Mon, 17 Feb 2025 02:05:37 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d53668d1sm68311605ad.75.2025.02.17.02.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:05:36 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 0/4] staging:gpib:agilent_82350b:Cleanup and spelling fixes
Date: Mon, 17 Feb 2025 15:35:09 +0530
Message-ID: <20250217100526.49495-1-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

1. Fixing spelling mistakes such as "havn't" → "haven't"
2. Removing unnecessary commented-out code
3. Cleaning up whitespace and formatting inconsistencies
4. Removing a empty line in if{} which was casuing it be read as single
line

These are minor changes aimed at improving code readability and maintainability.

I appreciate your time in reviewing this series.

Thanks,  
Ravi Kumar Kairi

Ravi Kumar Kairi (4):
  staging:gpib:agilent_82350b: Fixed spelling error
  staging:gpib:agilent_82350b: Removed commented out code
  staging:gpib:agilent_82350b:Removed blank line
  staging:gpib:agilent_82350b: Fix Indent issue with block

 .../staging/gpib/agilent_82350b/agilent_82350b.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

-- 
2.48.1

