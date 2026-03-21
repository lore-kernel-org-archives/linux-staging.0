Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2D282F0B
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774128463; cv=none; b=ivhLBX0pOCw03YTXu4BClDVO00Y1k/Uhllk0WgSsm62oAzfAGMgtV+mR/yvp5Sf/pESkzxuZ3RyvueTHnXMTwO3PilW4Qt08/XcLruaLUzDT6G2UCHmrAJH+a84vuTc88N0EGvchHPoyIHQG7bsSdIZh5M90jOj9yurOtZZxaFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774128463; c=relaxed/simple;
	bh=c+uGPFfPI8Dv2tWOYcQBg299DNSQ5YhpV+5pMkeGXZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhdxLKxdQJZYdm+Z5mFN7h+Ct0ufhDtPdyWDKf0+iIdSglJuam0TwS9DpQv4svvP/EZekfzIjM/3ladZP9iim00ODpxJse7zFlzPCCrkAeIYp2GFMiz1VK2384iB9mlU8IvbBnKYUmryRyUCUaAWH+DULdiKepnYZjTycMUuO+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=auYuiR5J; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="auYuiR5J"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b41b545d9so3672061f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 14:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774128460; x=1774733260; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=72ApMUurYX2GgJLwF7KgodErv2db4HcxpZX43xt8Nqk=;
        b=auYuiR5Jm7KmuWhVXceT7w5LtNTqKau6fojFAZFnrINjRrDwWPKP6vyJlxC7xXoetS
         6pJwNCKMMwEhtddGuwKFrWWt2xkobBueI9MRlJOpactz0/fXF2ADLH3QBJ9eKdsTPFeG
         ViKxBL3NbilDwfZAHArF3onP3Ecb/0JAk2BewUZ+ODCGQu2DKfDN4WF8InESAuSlsp0W
         iBqHTtYSZfhYdeeNr3yNMyt0Gu8Si0iMs+G8MFe8QaD5GJnLu26OJ9hGf/1UopcsgVsH
         uAGHE9bpHO0Q16IHDXh8aumXlRspxssml04diKMNfG4a8pq1LVG5eIIG2WzBaT6L/BcW
         7M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774128460; x=1774733260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72ApMUurYX2GgJLwF7KgodErv2db4HcxpZX43xt8Nqk=;
        b=C3gC+HVPRHHsiemdp2v1cidd7F5U9oQVVy7AGfJTtnJAY6yCD95NdAzP/rAiFh2ojg
         uJGJG+fPNxajO1/Tj+UQWpplc4Uwx+bqch54UHH3Bi4HceUmcAm5vyXr7gMZeRogOdz/
         VqSZeRt7iedndQ5UffOwfWFp7o7gCEP05PQDIlKikiLtu7UwHwdkLYospF1/067pLzg5
         FhGFmb+21MwhhC2TS+i3lEpB47GsRbaXWGbt0A8usS+54Kyuz7Zi0l/ppZdQp08e9acK
         /btEB9ZMZfoJsx9/ceTxM2QXBsWyPGbwmtF3GrdWwDfjUjNHDJyR8wrWhykwz1xV82x8
         8rEA==
X-Gm-Message-State: AOJu0YyDeFKGq9FRXyqwPaUkbWo0VrwKjudICqE6h1bHaRstXa47a6zL
	0woRoL2vY++kDD53nJA6I++XcI0G74rD60TbBYGXcuD4rWSSIUHT5v2dKiBVRt850/k=
X-Gm-Gg: ATEYQzx3aAAbW6gdL4ABmG0LXWHwW6EcB3B9wX/khU2hGVd6WowYH7NebNmUhEA0o/5
	lkjwaNq1jZJXOqVg0MabGMnnQGsqcMLCTN3ESgmdiCGRLUXWjf5ZXqIvKeBhDqq4hOyx6Fkxmey
	CW9vI9lD4bPhrpKGL0Rib4gDEidYOvQH5qdYU2ZyqoGzQcOT9iln5JRhXuCe3/7ohFJWUJLZZ15
	P2aWHHc2jm6nRiR0syk6MCeCsrvMCotKKSfCDv7eXXz2eylnV8gqK2tw9IZJn9owTZyHveU+Upt
	KEZV2j7bNaWivDj+JQrICt6RrvCuCimqb903Jp40fh80vcjDUExmJG6l9uS3Fibsh5m0R1lpNvE
	purH6Pu1FRP0O4o1+jLExdAb4aN3JDpQ1HZxl+3FivHjP4cyHopR9n88xZxhSSacadkjm9kqBEn
	2TBWxy2OPy4j++JQ7rPlFEFfd2uw7h
X-Received: by 2002:a05:6000:240b:b0:43a:580:f60d with SMTP id ffacd0b85a97d-43b64264bc4mr12386445f8f.35.1774128460075;
        Sat, 21 Mar 2026 14:27:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm15981010f8f.20.2026.03.21.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 14:27:39 -0700 (PDT)
Date: Sun, 22 Mar 2026 00:27:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] staging: rtl8723bs: clean up
 rtw_joinbss_event_prehandle
Message-ID: <ab8NSN0ypuc6WTmv@stanley.mountain>
References: <20260321182713.665872-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321182713.665872-1-azpijr@gmail.com>

On Sat, Mar 21, 2026 at 07:26:58PM +0100, Jose A. Perez de Azpillaga wrote:
> This series cleans up the rtw_joinbss_event_prehandle function in the
> rtl8723bs staging driver.
> 
> The first patch removes dead code guarded by the REJOIN macro, which is
> never defined in the kernel. This simplifies the function before the
> subsequent refactor.
> 
> The second patch refactors the function using guard clauses and early
> returns to reduce deep indentation, improving overall readability.
> 
> v4:
> - Removed redundant return at the end of the void function.
> - Fixed typo in v3 cover letter. ("Rmoed" -> "Removed")
> - Picked up Reviewed-by tag from Luka Gejak.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

