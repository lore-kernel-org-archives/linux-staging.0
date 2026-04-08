Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1825E37D124
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647667; cv=none; b=As9EmhBSmtvkaNFjzZ7YhkgfZPWmPqk6Q+mcLWw9NhK0CWJ7ge9z//NuhCrCOKo07jSTcdqn+PJ3CtNr4srrSe88zDf66CZIJwtAB3FtnU61/JYr4BAfv+198G8ws6G6eIySBZtH2LFSf63PXlV1yqeoXb7hF7eubQqLjoBmRRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647667; c=relaxed/simple;
	bh=FFzPyfPnDedU9o3T5IuYqRSt5pBgEj7nzhDUsUoHS6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CMktwlcLzLkpP3VKgfj1I6ZEWfN3fvvIk0BaGlOIYHOBJrkHikO3WvN5gpnoMVL3z7xACddqB+JM3kJFGeKX5hSMDW4BCqgYnMaRt2FSDWaAJXWlRsmpTA2HeS/MwCHSBVBGJdSHGMDkwLHZc4A08KsohVXfpTBU6IJI7pdNvdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdjMk6X0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdjMk6X0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so6717535e9.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775647664; x=1776252464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFzPyfPnDedU9o3T5IuYqRSt5pBgEj7nzhDUsUoHS6I=;
        b=VdjMk6X0fLPyY05hJUtdrjEWt5+wpcPWBPvXjfx53TXYEYVYO/pGwGDrIsB/Pmt9Qi
         m/1NMFBZQckZftL17bRnk4J9nUYYNOVZ381FDHslURwFipZqjp1md4a8isyikkTl7Zgm
         WJ/N4Z3ey+9miGHqcEh1bSCidLGGCgOna0k3mbVOLZs9vUXKflvJdf6Rr+HSPnMXpD6o
         UbjvE1lbt1k6jWLSnK9o5eHgJUIAVl52v+xmrtnlSD1SsAbXOvwTu2Fk9XmDrVaRQwtJ
         aeS1eo73jlklOIywBMtbYBSVCZBWy0nI/vVTRV94TxHHyf5SsVkjABSG5VzGt4jLLbTa
         H0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775647664; x=1776252464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFzPyfPnDedU9o3T5IuYqRSt5pBgEj7nzhDUsUoHS6I=;
        b=Uy9yrzbuBjso95xPfrqh6ZLjrUyxSomyFFNvfXda6Hbt4exzAh80pP++oG5URKQhay
         5Xynul97FSzA3peCkl9ipICLpexZhwwSrC0hClrZ8CwTzyA41qjDKo/zHyu/Dfj6vmhA
         LgpoY+U6aOyO+uAMpno5/bYqYBQNJkzZpgFRibCe1c35VLbLH8cBx0Pum9iY8Th23etq
         lvY5zd/78B+RWBfGEZVg0ZCsTttvHytydz401cKRmwj8mXJA96Ke/+k7Ne/sxhcXZ0qy
         b/eaMBvG1nO5psig2CF0vYUCo9t8hy1hjB13xxIUnk4OML087LX9Uh+041i9U2ygjq0X
         I8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlBwxzGOIcNsy1fhfe2Ab2lRlHxSsVZ7lls8luPG7/bLZGvTJkeL7ODTVila9g7YcwQZnGRHygIhqcFkSO@lists.linux.dev
X-Gm-Message-State: AOJu0YxrSlLW0Fa1bMrxS9SKNbbk/Bz96Dc2hQUkTOuw/ElEfYjvXFER
	6vuTj0XAb/MuUs6BDHRUw4Q6IC/+meoRTNox41Cw65MuXiGhAicEU+Zw
X-Gm-Gg: AeBDieu+HWiRkXSpMj4NATQjOzAv4kchqWol3nJ+mAKqy9wiWb542/+qxoZ939KjOs/
	rDw9ZfLeqQWYoQ+JjcaGSb6eiGMqJaxAbHF7OANqVKw6h2mu/Uy4qtMyoH+tlAZL2bks6Km27vh
	jl+OF5wbqL/4Yoonqyzzw8WoukXYn5McChsFBpTzFS7KdnFr65GcVd34N2ES9JGwVzrFH0uALlX
	Xms62ebahBpI+Cf0FKck6nfYR/sEx8FMGKxfmQTkdfONo4HupppUCKAnlYpH99GnLJmfBNfaL4u
	YRG0JW53upzVVGUp3Xs5UnyE8T4x3RD6PoOZN4VMJ/Eo1Pj6ptmc/A0AQnzNjQj9Nyemf0KG32C
	2egPOlAHX8r2p+0Rqq6f4b4KO0bkRDlWxtNXpurGl64YxfoQerzii1yYd5NV7WKsh168moKeOj1
	jRPs0FhSiqUn6SlgGGDneLGSOBNZdnwMzYWypoATSsDCQtg/YLoH/E
X-Received: by 2002:a05:600c:450d:b0:485:3428:774c with SMTP id 5b1f17b1804b1-4889946a42emr80874745e9.4.1775647664328;
        Wed, 08 Apr 2026 04:27:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:d997:3078:a4d3:4f51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c531ab02sm27193415e9.1.2026.04.08.04.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:27:43 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Gromm <christian.gromm@microchip.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: replace BUG_ON() with WARN_ON() in comp_exit()
Date: Wed,  8 Apr 2026 12:27:41 +0100
Message-Id: <20260408112741.94707-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260408090024.51814-1-grondon@gmail.com>
References: <20260408090024.51814-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 8 Apr 2026 12:48:42 +0200, Greg Kroah-Hartman wrote:
> WARN_ON() also crashes the system when panic-on-warn is enabled (as it
> is in a few billion Linux systems...)
>
> So please handle this properly, don't crash.

Good point, will send v2 with pr_warn() instead.

Thanks,
Gabriel
