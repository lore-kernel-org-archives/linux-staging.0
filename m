Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842433F8B4
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776249178; cv=pass; b=srkBdIReGoOOi0f9+haP/68CW7UQU9Ue9oIYOI4ggpM9sxkAZ5hghCK908/jr/WnDDmDKMWO6GA8BpdpNJ/f9mMYJpjdBka2FpUpr2yCK2IzhsRVHhJTLyrqXifSGiWxi0sUtBByloTtVFRNiFoHdXq/NwPHuKMRkphWGzkQmpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776249178; c=relaxed/simple;
	bh=gcUlsEe1M4tzNlnYTIpyjWlGZA4y5WzBESrSumGsR1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYxf6GCMbzguN6PsmuBL+LRLnFbbDeNVyXzJ57VlIQm2+WkjnlbwYc/JfOfB2enV7tGAq3zR7exUB6UKjPb/+gNyDXhLu99v/HTvmc5V3nCU+f/BBingRFAMLAS/8VyjNiGc4KwG6EX4CtCBkX4Dd3lFSqXxHKJVJrFAimJH9nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0xG8Un9; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0xG8Un9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cfd832155so4563872f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 03:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776249175; cv=none;
        d=google.com; s=arc-20240605;
        b=KfDYeslkWNKGXhFVYOqcFkNxTJEiAwiQw2MNJQ5M+0Y459rgnS5d2zmgV5mocCH2ZQ
         vTYoRXoUrtb+yJDe3yMLT3+FGlx/oRWOp71EFJeZtlr22RDCm1nmoGZfvmkK2eiJnd32
         UoI4iXLdnppHJ3BpYxBZ2dSs0GpYLA0de7YDPH4lp8RK3taS5hyfGkeQAKUYQ3p47VMr
         XS00QMGoZUQFI5Ys0U6JWROMqXTsNFx7wHTi1/pjB9Q+MR5an35xKoO9Vr9ynwUMTAg5
         WjsK6o7mkxg2WxiXPp0QHBiRqnlI0nad3K5izSfKtsSIGB6D4Y3O2boMk3oO56i2DyIe
         SZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9wg0fKScsyEBn6qNWWO0CXKsqKDKHGGyC5rF436bmzM=;
        fh=5mAofx1/ksjTCN6LqFOJaNYDoUW8Fr4rbBkFaal+EBM=;
        b=eXMMef9kqKbpX0gh57NodUiblqT8Q9vGGbzsTfpAkU7ZVBmC1GYsC7yuZVT/7ZD5hq
         oL/aYz1k1OYjDrtdp2FrbvkPNnD8RbU7VIeJe3ucego5US8aQBjUX2l0qoeSwEEAHwdF
         SeQ6Lv5qxsGTjV2QazFrVjQRcUXmrnRBupyrv8IkESzyolChmjPY9CYKmtS9K2f/EDIS
         I6Uqp94HY5G3xq5lE/X5lCeYWdRUJcsN75CfQvfCjJKhEnEyZIZlkTycaMtqzfQ2isnr
         BmBrMKrjDjwJTZowaV9p80BfXo8lXJbVO5WK57Y6YExQy0VEQw4rVxAK3ZqkwivyZspU
         nFrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776249175; x=1776853975; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wg0fKScsyEBn6qNWWO0CXKsqKDKHGGyC5rF436bmzM=;
        b=T0xG8Un9/tptSp8Gcse7ISPVqeh9GSFBeu73njMQIgEGCWLz6jhqDzizsixuyfsCcl
         MkVh6SCkhVFAcE8BWlkrIPKjdpyGhDppAd+mUlBry9sBQ6JXukIzRe6E+7DhimbMfQvO
         ubO6KJP+R/S33ozatV6fZ4/LUgxUeaQkOQNLvIpm0WmKmZ04ycG7swErLVzT+eY6N+pb
         R9ATGHZSK7IWoxWYi7R5yEVnbeQn/2GKoGHgU1gwGvuKg9VfOzkMIwCVSGI7b7cvMlc5
         Na3QJDUxSq/s2yaw/gpoklyMDXSZf5aN0e63BceCHHcneAEe8ICNt/LgSvhqNeO1RcU2
         kpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776249175; x=1776853975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wg0fKScsyEBn6qNWWO0CXKsqKDKHGGyC5rF436bmzM=;
        b=lROApWFyMiekjDjRdVtvFgI8u4Ra8DYno9qOPXT766C2ewoeZrdqciJA5cFkvZxbUa
         K/A4Zj5yCHnamkyIoSNR/3t/s1xwCo/irkcPy941sErDr6U7aDrdIcnep6BEm/nXgcS+
         w+S6/+rudDtsnMX//PJLG1k8vKRplA3U66IUi0KAwkLmpNwGMvTBkMsi15Nd0D45n72U
         hyrdnR3eOVrOyaxkH2T7YcIGqIY8rSa5Xn5K2oFl20cixypnIqZZ2MbrdXL117W5kUwB
         ycz30DDb7OGNAkljBh1BI8t1b+vb5CPfmWtsQgIT8DbChkvrvuOa7OuxT+d4Aq3t4vTD
         3SpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OFDqW9HF3MYYNemcmoRqgvcFvq/3XKhOtOfBN8s1VQiYJRDX1PXVWQ7UJnPiHdpeOnyD+b6miwO+5PFOE@lists.linux.dev
X-Gm-Message-State: AOJu0YzJnqX10nthUPiHvTZkTEfASLAVElsMnMZXYBnERUFPLr8J/OYC
	cYIUnXOYskfWeffjgzmnlqaB4BRps1cwYKcLCoqDFYwZZxmYeXnCWzk3Rs5tVTTbK0ZAlzI9lZ+
	kBLJ1f31fn9Nw5P4Q+k1fB4W8IRJrXPk=
X-Gm-Gg: AeBDiesNWD7KAK0am4n4ksM5oiA1blv9KqSo+BaHpgqoqNoOuiyJsSqBLEp1A0pa0x1
	5qj8KOJRCWNkg5svEdDJoO3J46sAaSgv6VnCgBw9KF+Yzb5cONDqvPDdbsQJrFNVKpDqDKCKf4v
	bAoKYPMt19+zpd15sM4jrBdNWME5lDLGfoKszqsEi9K3r3sJ9RKa3NUqVnxLO/TER/P12W1DRPU
	Br4HihGoWsgMRdJcMuI9ddPQbqBW1PK+m4l4UEF8bnRK+7GuIpLBB1ModRtDnZcC27+q154TYgO
	Dgt+Q/bkdIIfZfrxYh2XX1idqNz7TEXQXVOKQzj4xid4138Fl+KRGieUpsmqFUEYN8NS3+ynx9L
	MoT/uIjYDbj9mkqimCMbVDe4T2ppD9zBobYpYQBF2RHK5vINfxFcFc/+IDYzTVqmZrHxNOHfkoY
	qNV8Kk7BP7lZyB1Bwc
X-Received: by 2002:adf:e10f:0:b0:43d:6fce:3e7 with SMTP id
 ffacd0b85a97d-43d6fce05aemr16298060f8f.3.1776249175359; Wed, 15 Apr 2026
 03:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415080812.1284-1-joshua.crofts1@gmail.com>
 <20260415080812.1284-2-joshua.crofts1@gmail.com> <ad9SzwJDwRNldv_z@ashevche-desk.local>
 <CALoEA-xy6WApV+ZUavnEipTKiAezYkXMwiE++TjtHuxkVdR1mw@mail.gmail.com>
 <ad9jThxf6PINFFmo@ashevche-desk.local> <ad9jtH1YgA6N6FYg@ashevche-desk.local>
 <CALoEA-xopdHNGtBJQk1_cZZ823qu1_8EM5GR2tB+RdYyuWpWEg@mail.gmail.com> <ad9moW8lYDuOf77B@ashevche-desk.local>
In-Reply-To: <ad9moW8lYDuOf77B@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 15 Apr 2026 12:32:54 +0200
X-Gm-Features: AQROBzAgpxF5G8IgFGjxZKbl2u3PYui6wKyUQ6Gospib9V0hi49nEmhGE3PiYAs
Message-ID: <CALoEA-zSX6hF2nxx696CkyrxCuNRjH9BaB-J1NfyQgs4ZpC4ag@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 12:21, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Yes, please. And don't forget to carry on the given tag.

Okay, will do tomorrow.

-- 
Kind regards

CJD
