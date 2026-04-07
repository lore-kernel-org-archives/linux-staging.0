Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C00A335BBB
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 06:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543577; cv=pass; b=Ex1a7JUyzbYnWzvoaPzMh/yDv7XMPagbhqI8jEppRKGRsGFkznumYeZVlabItai4J0aHQHA2/lQzzYLEQlBZKFXaaxFWDVZEbR3YjrciZtnn3LlZtcLbs9AZGY95mP4kWoIP3ov4moVtbxvQObhiaOxCoMJKtiI2acLVVg7ey6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543577; c=relaxed/simple;
	bh=BDU8G9o9xgJcAL08GeyWae/GCAQIm8z/fRlppWexggE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nA0qpPPli083KfXwsjNAUQVxgJevCuPWLEscZusMPdVndUhoRBPYOdbq+dnzPMrffx8IGUcH/uVw/vwE6qslfVjsWdsej85U1dM0UcsL/rTfQoT1hR3IRvZPhJYCNdQkvscd0lJkIDKQ5NrYaEhjT8Z6QypLHoooKx3G18EVOBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KICoZbHJ; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KICoZbHJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d02a71526so2637739f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 23:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775543575; cv=none;
        d=google.com; s=arc-20240605;
        b=dSq2D8Vtvi8f2DzfRwZmqH9mO7kOi3QV/L8csny+rciqbxnYiS2WEP5YQFwRRTfyI1
         aiEfI/+zs/8DhnpjJ8QofHLfkT/GL1vFqxy4I4hJlQS15IfWiKRVuk4raGLYh19xuGwm
         8XukSFNWYFh7V9+gDt8O9qV+/rHmUhDVPy72Gv08eiTx3iFvHY4306rrh3NY1CByN/F3
         k2uGkTW/TKK5b+ChZkC2WIrDuFUaS6Fifz5pXx+mImbyMnDyT7PFffoMa+WJv0Fb/0HI
         mV8tbciMpnp8QhtAEMsQor07DbsNQtS6XHhTvQHWG5697LOMB9jXNxZ4N++ImZRxO7Ip
         Aa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BDU8G9o9xgJcAL08GeyWae/GCAQIm8z/fRlppWexggE=;
        fh=ufY7Yik5VP9dxSRVd8quSpNF0dAYkNaSKlJHQnr5gzU=;
        b=LJTQCydUKyvrlCuOlVgJ9qcs4/KTc0Pyienz9o1VNcsBAjrxWYownjFLT0YNbvRGNB
         y83yZB9dLJumh0Z1udUWwMvzPpoyqtE8vbMsrzNP6Y9BbKV5MMXSJ5sFZOtH2ju6Ci+3
         eatDcem9lLeia9pevhHjFIIxwjeOQy+elf6HeBkO6wxQ7mj/laPSvSFZWYzBGvTPkt0b
         pLynwkSd2ZJpK0OsuK8uP2Gm0qloAvPRzRiw/HO+rHKq5uLv7icGeHbutgeJ0rTkerOy
         xSgmNN+HAn3zPA1lbkxe8MT9ZLI+xNEpXYLLq96fHvAHg4/1E47Qk4XE1XcBKFOUnM3Y
         2lsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775543575; x=1776148375; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BDU8G9o9xgJcAL08GeyWae/GCAQIm8z/fRlppWexggE=;
        b=KICoZbHJNGSCeB8Fju8OJmrZCWYkQsM0TVBupEFdBwLqV8wAWa+xI/qWhvreV5EpT6
         fzLcEE+/7Y4FvdNhL+5FEP+6v9Nl/imKT7aizOlI9qlMQvyfz+6WuzhYZDZRzgLo4fLs
         K698Tqa9jZiHJ4gTbJbuIaGI71aEMngTBOxLjY6dvQoZZPOSl/SCH4AKVDfCY7CTRlA9
         BjOEiKILNRLudk/g5fRTBK+uxIIz3RflngR7v0kDLip8oQEu9hdJRaBRe2C0gIeaXajG
         l25Ga7VK9KaDJx3mUR1nxejR6ePJm6ck8NWY/ldJEr1+qEvQUgFF5BVQlxV5K/vhB3hv
         PZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775543575; x=1776148375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDU8G9o9xgJcAL08GeyWae/GCAQIm8z/fRlppWexggE=;
        b=GVhF97iOcrggIdMgVeVqDDP9roJQvvdobCBOf0CpmFyEz4HaWB6i2QlxOHBh9pnsqz
         PaxMn97xDEVoMI+PMtNuyAc+pARbKCs0UrgNjv0XwH2T6atHem9miiqUhbfSU2QrcYsS
         Hase6XRrl8eix0JddWm/zu8W9KEjfkquNhUwt1PpeFwUsCli3E47l88GAxE02Z3fA9oL
         eEYcw2XP6e/rAPRQQiMnAR2uJpHkjKLssdPlKQbS4/ahoZqbq2OUXQeU1z9ASF/VnCkL
         2G887W8AxIyaOlpcUS2oOZaOCUHV3rIDmnHutkPr1DEDOtlDpkNSkHKMY0DsGHjgFASZ
         VObQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOVyEaE3hh1XimZZibY1oXUpaN6HzvjLkMP4vBaHUQQV6kdDvnK9JfBPV+AuG83gvKpxcNHqjvBiJrnruG@lists.linux.dev
X-Gm-Message-State: AOJu0YxXyzziGO5zh4KOvgbLN5GCaRM3yx26uusDZpYKF0cCHAoWXARK
	PnNIQxdoGcbpqPd71SPmCJoEwHLUMNhX5EeoUvh2Qzr83nRjkMt5uGr6qULYQrdOKy1aqMsfBcH
	GT4Qn4AqWCTTFbRjekoFT6mlyhF/BrBQ=
X-Gm-Gg: AeBDievbhaEawqygAaseYK8v1xdQY1Pu89P90BLBCJvo0i4P5U/cx/LXCWdRagq4j2y
	MLWxBdQKKHUl7Khu5lmZMWhyxFx2hQXQgh+WpCQjwV1sx1LbVs7qomAKzJOVqsfTWSinpHYBXMo
	0G566LRUhpIydtvnjlWga5Hk9nTLaGpBZlQXelXaBrKqV/ob1oldK7RvC9sT7q45tcl/vUrGTMU
	m27m5PsXUoWpQ5QmFQVhunlTdCvTkKJzbhbzmdtI9MwvKef+Q5cwcqUKToPAR3YPncKih1y3UbT
	pANsXd6FgW5VslEncDocov9kXpnt/GIH9CEbT3wnH90fL5/ZotXuB0KNODQXVgHAcnP/5pHZ+Pz
	TofVX70vJuwuWD685JQPR64CnpYfrIFhXVJvB
X-Received: by 2002:a05:6000:186c:b0:43b:41df:705e with SMTP id
 ffacd0b85a97d-43d2930fc4fmr22574573f8f.49.1775543574370; Mon, 06 Apr 2026
 23:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <adFrJmqSfx7dEJWt@ashevche-desk.local> <20260405143910.10517-1-joshua.crofts1@gmail.com>
 <adQMUrq7LlR2qAdF@ashevche-desk.local>
In-Reply-To: <adQMUrq7LlR2qAdF@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 7 Apr 2026 08:32:51 +0200
X-Gm-Features: AQROBzBpOTZjy8bjtOCcWEqUaBN85cH9_jFgAoPflaF1UBjSIeWB8hmh-oVZTZ8
Message-ID: <CALoEA-x-2hRQrAzJRKijrNhvM-a4kdNKbka4WBm9J4PY_5te9Q@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: cleanup parenthesis alignment
 in pci.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, grondon@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Apr 2026 at 21:41, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> Thanks for doing this. However, the proper fix should be the getting rid of
> copy_from_compatible() in favour of using iov_iter. You can consult with
> this example:
> 49aa6ed94c5e ("ALSA: korg1212: Convert to generic PCM copy ops")
>
Okay, I'll have a look at it. Thanks for the heads up about this problem.

> The current patch in its form is quite low priority and not guaranteed to be
> ever applied. Sorry, we consider real patches to be done first, see above.
>
Fair enough, I would've expected formatting to be low priority. This
is the first
patch I've worked on so at least I got to scope out what's what. Either way,
thanks for the reviews.

Kind regards

CJD
