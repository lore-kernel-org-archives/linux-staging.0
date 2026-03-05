Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D72BEC43
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 22:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749308; cv=none; b=rOxKIgdTqBBsrMYUDbXqvJfPgz1ODi0IeJdcmCOeB1vElq00n2bwvJvfwH/Y1iYbwoe7D1E0Htzdr4FuWNhTb+PCvsyuAWM9Zxx0FTQZexm4YWP6Jj+U+XO/MJetb/0agiodjZinGo5B93sf/UkvUWFtu4DNsJ1waXSxPjK+V7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749308; c=relaxed/simple;
	bh=/k64JnoKa2ZtZdc0lstUdVgfP0q9tM/zt1GhBLLKDzQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PJzDa7Ic5edzj5lXzt8QXCPd8UtNQxzO8XOVvFvmwHk6GFcoMuT2Dzu+Irsm2EQSRs4smpRpFwq9slV3ufTNyUoOlv0juDChDkSTmxga5VlEOGWBQCwwYWELAonRB1Nhpks0e1b4Fkw0wx5l+viDXHFVIQN7585eSOynaDtpkK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYrCCnxm; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYrCCnxm"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79868eae536so88203627b3.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 14:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772749306; x=1773354106; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k64JnoKa2ZtZdc0lstUdVgfP0q9tM/zt1GhBLLKDzQ=;
        b=gYrCCnxmz2K5/DA0SUzeOkVvcMYqepvB2Yt3LBt0i40deSXQTkukv6U2PCaAWqzZTB
         /QAXmbbL8oxgPnVETLlU8wdh2jigv+bM/HgzDIsbjdYilWrcUvJ3p/WPDtll61uCNVt9
         r0bxGPDAg49HxRHY/Tm3hba8RWijLn0EN/KUDVKSrfPZ8aSn0PpqCXqMaqEabzMrjP5W
         LOXMJtQEDvo7jSay244aAaIGK3ikRuG4K8A3PqHEXejlOltG3/bJYi9+bv7hIS6wGM4o
         00vik3Kn1hJKZFEJDJW1JJMLqyYXKrIQwUu9rHkoUnTePE0ke3sn4WgZ1DS0Mj8B4dEX
         g+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749306; x=1773354106;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/k64JnoKa2ZtZdc0lstUdVgfP0q9tM/zt1GhBLLKDzQ=;
        b=m6jYpbWMfuLXTu6AxgJQRqBnCDXRXmWKg8IBvFGFZ1SUxZbCMy/NaqYvbUGFndTeB7
         GGudjRYe0uB1+zxSBj7QEk6gjnmiu1Y9sytB1Pw3nC/WHibyhefbUVwBn9wF1BM5Gekl
         tuD9hZHhiz1T3lVoScuqARDQRkHhfBeHUXboClwri9EBcmA4CYXXxCVLQdIgV3QiPrcc
         kZ1gbDeJiErgFgZHk0IVjfuvS5FLWytmH06ugfhwfsrdep7ozeY89iDLNrJecVdtrK9J
         1KTQr0lrMva5jbIdVcwEONB5qyNTypvDO4WhjvUxkRZ2ilXg4gziHBsn4izQlFXguV6h
         Z2ig==
X-Gm-Message-State: AOJu0YwxMCZxnzHhxpC4LstLu7SQ6ljVPoZ8xphA4//074UzjOMRIIiR
	IqUJfwgc06ajjM+lguwY/eGbNbQDjvJnP+Q7vmbon6sv1+DD0sT5/+RH
X-Gm-Gg: ATEYQzxOe8JDVJKmUkNv1JNq+Pv7iOMyzDf8N9A66V0XyZOFVQsVtz3OfYt0GedhAZg
	3+DpBefUmjknguqK73eGdpZqlpxnQUbXJwxzhteLqep29Ss7opQ0RiUHLSGqKQl5kNnOPM7KuUM
	pRSkqN6dpeT7T19qtN8LWoop5F74DgB4m3ENIH+Z51WQpunBWGRiUX6n0hba5d2fVwg2zltVs+/
	qlgvY3yMabLhMGppyRJZJd6imWMiYBuhr5adbctjC/iYEZ09zLzDJMbD1mTMJlxbnsi/UFJggDT
	CcFRcUXpDXp/UI+3TSY34zMDGrCzb06DfD9YeM1E7PYi3UxfzaoPAjnAHHSUmu/rLXfoHhqkAYu
	XRyc3/yYzMoQQpdgHT3sVk+Tl3sPMEKrDclChY4hO/pWW/fM9AlduVdjp3YUyOwSFwf+PgPZFJF
	OjNJIdtR897h71GqZKMSADjA+UaYwUL/vV8CKlYmOoWUfL8HO0KmGBJinxTFf3BtLzvLJkzfbnd
	LVeWsWylzK/tmrgwd5pNHIwlV0Sa+ka9bRG1CcFk4U=
X-Received: by 2002:a05:690c:498f:b0:798:7017:6cf7 with SMTP id 00721157ae682-798da50facamr18214477b3.37.1772749306521;
        Thu, 05 Mar 2026 14:21:46 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798c256f6dcsm31519707b3.29.2026.03.05.14.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 14:21:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:21:26 -0600
Message-Id: <DGV76BJCL210.3MQY6FQ4B7IHO@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Fix spelling mistake in comment
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-rtl8723bs-fix-spelling-v1-1-e2bcc89d5311.ref@yahoo.pl>
 <20260304-rtl8723bs-fix-spelling-v1-1-e2bcc89d5311@yahoo.pl>
In-Reply-To: <20260304-rtl8723bs-fix-spelling-v1-1-e2bcc89d5311@yahoo.pl>

On Wed Mar 4, 2026 at 2:41 AM CST, Tomasz Unger wrote:
> Fix typo 'termindate' -> 'terminate' in a comment.
> Found with codespell. No other occurrences in this file.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
