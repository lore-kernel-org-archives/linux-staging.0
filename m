Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475C21D3C0
	for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753078467; cv=none; b=DMrudUZokDWQ2GcbwqSUQ6sxFyRyIS1b+rV09x0fWNZj35bue/CMLuyvta+2yEqo1cL6eaqlinaIDdsGXzdINvSmdOHt6uivEruBwokOl1S2xUQ40npb9eD/aexWNkd5090QhOhHy8Gqxn0AjGki3SGzqzfDCZ6ljs4nCoAqGT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753078467; c=relaxed/simple;
	bh=SjzPu7li/w++7SuHXLHXUxL28Hj/1zgWJ2+9pgGwAOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GRSsMvclOHvGc4wYCBMwlvHAHd5zbXRffWFt6fhpnfEHYYltSILa1L/5lurMmGpf3yWkkAbkQzTKd0vzNqzSPb6thK5nDm1FMLLSK6M01ZDj+Ik5jODLJZHQ1gpcQcyInO5FXRKFRV41UfyQwheQS2F5xVjK5Tf5zZY33I5PKmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZI2EhIE9; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZI2EhIE9"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7dfc604107eso385407685a.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753078465; x=1753683265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUrJjxdlJkuWAxks6dZw4thmAFt0XlgLRPKiCZOnDHs=;
        b=ZI2EhIE9aj7miI/e7+P03sC8H6ML4pEERbhTNEIVanTbJWr402Zt7OFLAV6BcIOdDY
         Wu4zSLgvryG1zKm7FRdOrKL0B2w0bsh+ohFKoHvGquWznqpHUm3Q0Jz/syLhMlAqYsqU
         MwNRwSQUyF06RJTMxPtYG2cQOymyB2AqjTBZlg0B6iwd0xwMFUmIDjuMqqtpjmdmsHl2
         betlW035JWjSjwpvbmt21fPMKGr99XhfL3KRSYSsOcAk5OnLjbFMi+xYXwLMZTrXlDIg
         zjeTmUpPEzxNHZu2dsBtba41m7K/79kNKHd57N1CDUMp5GsFIlqG4btHG3EfQEgDQye4
         3fDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753078465; x=1753683265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUrJjxdlJkuWAxks6dZw4thmAFt0XlgLRPKiCZOnDHs=;
        b=lXT7LofNQAqTLSB7XsBfC/NIM7ne5a1iUuajen0RafBCoJl+8fftN+IBkC45H2JHeA
         e0eGkwG124aHOYD+4tZZZCtb3ZrytqlMEvb7Fua7xoAjzV/yk9bGsRjfS6xx6IqhadfC
         pJEbXiLRRAuABjvRLn3BqvqjSXH+K5wh1Fcu7HsekWpuXtwmSV5mAWMlStOEM5aEFIi5
         z5pQrTlpSOj8je0pFOMUlNsv0X8ou2Pf4fqJbeg7VpRN6bR2s6TmnnxwZU1eXmllKKda
         SqVj3/BtxG0GH/WMIX4+ewASRnpDfx7E8PJNSXpA1eXw3Ei2uJqOSSFg58LE9I+sp6vt
         fzag==
X-Forwarded-Encrypted: i=1; AJvYcCUhMHBIXb1GcJMJ+F6ZK4XvvNbygRoVic45c7mCIcU2aDxOIm8GcCybfVLXJDYDUAyyKBtYEYmG9VtjK7wS@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp05TYotKb+g8ixAck0cbTnHSvbB/UkbbgdtGRVrlkpgoQUCFg
	MqmY1uT/RhQxdCnfGNvdtfFy5vCQZWirtyyZfJpRq67VTDNjFIQjLbqR
X-Gm-Gg: ASbGncuH7hE5W4DpgKS5miUquzPyMANa4JAZtyapw2nRqncGcIYq90EyMVBnpmv/S8E
	TQ+KZhOwq5ph1yVPDsaeXF1ccHw41+4uYSBv6RalPWlufc4jqvW5mjAM3ctU1kg2JjdGsmVNuSN
	NsbciiadY4kKSUXJfWGlqDlrKXNXDt8m4XebSDSuNGXl+yC45dFhAXTGdhftmWUH+Lv0Ut8VCSw
	Q9vIDdJQoW/1loIbKmBg30oPWIHi65NOOPsLLq1GxBsS0AiV5uHkZd7WBwzaD2PtTAUgjrDV4da
	/UErXCBXvGqayhgfEiICzfphE48X5WKUtBwmpKlqeB6at+G3MjpbueHOhunyfOkdpWcWK+rQZSA
	J/E1+Rk6ZFjM7Trz5QAN2sOj5F03Qq4yTXAcG1CCZG6siTsVnYg2a2SC7+T8sZA==
X-Google-Smtp-Source: AGHT+IFV7evOdBXehEGbcmPmJL5cgVgd/HztZtKye5eZOfaD+ktrMiMzzud3BxNWK8s3itPM1PBBJw==
X-Received: by 2002:a05:620a:191f:b0:7e3:3604:5047 with SMTP id af79cd13be357-7e3436156a6mr1965809785a.38.1753078465256;
        Sun, 20 Jul 2025 23:14:25 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c3e36fsm379185485a.66.2025.07.20.23.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 23:14:24 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: vivek.balachandhar@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: clean up redundant & parentheses
Date: Mon, 21 Jul 2025 06:14:12 +0000
Message-Id: <20250721061412.297554-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250720092125.246844-1-vivek.balachandhar@gmail.com>
References: <20250720092125.246844-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks again for your earlier feedback on the patch cleanup for rtw_mlme.c.

Since the original version included multiple checkpatch.pl fixes 
(like spacing and formatting) and you suggested breaking them up by type, 

I wanted to ask:

For the remaining cleanups (e.g., spacing issues), should I submit them as:

separate standalone patches, or

as new versions (v2, v3, etc.) building on the current patch?

Just wanted to be sure I follow the preferred approach.

Thanks for your guidance!

Best 
Vivek
