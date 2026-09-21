Received: from mail-pj2-f31.google.com (mail-pj2-f31.google.com [74.125.227.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9D4C10CE
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010229; cv=none; b=Eh9FPibBD6FG0JGiPqDr1psIxYwUUYsvx6/PWxbBH6ve2qT//XOX9eyW4W1eh0mv/dpIvJBTfDkVE0dqqdW91s+3KQYrXpixoHC/Nc3/weLbygAbDR38yh/bD7c0pda4u5VyDQJPEFGl4CJNNxZyBsTkrbQqjREAKR8Hiym6zwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010229; c=relaxed/simple;
	bh=68vTwwjgSnNRQpy9d2c5Lju/Q7J8YurUvH9POQxSmpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFXyAHBC4xY1MEhP4OQnpAzOJjiOG/VF450AGjf+6o1QiHlZDyXxwuHIsaNgOZ/hN7Ms4n7kB9rZhbrLgyNJwj894vTR+l51WMNzHJu8T3GZaHGVHIIUD+4LeCLVL6h3vqDkHOwf+aJGN212tm/3Mqt/y1u66ZfJ95MIA5GEMoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p42bxzk9; arc=none smtp.client-ip=74.125.227.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p42bxzk9"
Received: by mail-pj2-f31.google.com with SMTP id d9443c01a7336-2dd53691be5so30251825ad.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790010227; x=1790615027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68vTwwjgSnNRQpy9d2c5Lju/Q7J8YurUvH9POQxSmpE=;
        b=p42bxzk9QzJ5zS+bNT+PM5x5bQWLqli5FkbUzR5ESptCkxacs6+4HduMJymPDps+mt
         69oJV9OvQOLLxMICt9TeyzBPa7noRdnnp45d1kR6AC6lzcVXKu2Mn3bHkAoHGjB7Ph7f
         iXDnClqEAIQCS9y0XD6zfdfBctYyT/ZbBCFo6BhmrYHqfM1nv0qK05DvFUSlBo4muJNx
         csScT8zDvthFfWjUd7MSlp8M2LEcGk4ML6JMWvZk8qKcxybGULgtMq7cxRJ02LneHGkg
         xGKtegfpkXDRblxgOYcBi1Q3mqyHEEvdgLbvipmnTE+WfgNvH2Gs8glIJTwBVVChxtbv
         RP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010227; x=1790615027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=68vTwwjgSnNRQpy9d2c5Lju/Q7J8YurUvH9POQxSmpE=;
        b=vxCIorWKj7uX4MuBIWq1sX5vLfTnEHXzW3wWPvHm0EeBtoCvEkPUTHiTb3mWiFG5uB
         96JCF5IAEf9lp8+98vbaZ25liMQ1I0qT4ubrQy85HH3g+AczwGC/uiM7klEV1BSnGrTD
         v5Igv6Gk68SlNnDC5vvfXd1hLkRihHwdgXQ9cHVKB9dy8uiYFEOcAfeMuETRybOCFCWo
         zDJRptktiT4VF5Pk+7h6vLRY/kWuwCnXYdAlmDXRbHC9btCgseoCXcev+QQvd3H9waeQ
         S2V/Yr/f11SZoLxBTW0b8EWQNdIwmavhLtjp00CdW5/FwjvcgGTGxxW3lv9c+ggPkkeT
         lUWg==
X-Forwarded-Encrypted: i=1; AKwUvBwSblYD+gw6ysRgZMXJy9yo5IL4sSSuaqTk5RdVxUw6ipylFWARKc1MKKdOdotDmRuL0m4AoDPPbN/xDNHN@lists.linux.dev
X-Gm-Message-State: AFuF++koGj3cu2pr46yk3kAv0I4xF+Jm2imMApbcWC2HfN5wk4l5JwES
	apo8G/h0pfob0/fA2ZGEo7MaRocJrR3BqgVqyOOP2iX1PKAqLzfyTGtG5YMh1JqEv6M=
X-Gm-Gg: AYBFou0BZF8njXYwTiiIsGJR1rPattJRK///4AyvSMxoeBGwTOWTSWf3MubBatuvU3R
	G5se6ySpqSMvNlk21hBrpv1gkN4vsqIYCBEzxV761FiJPElVTTTvlUOsl/dS1vUfky3/VDJ4gri
	5VQDdbGbzReJ9pd57815Adynd7ul8ZESnuPB1SRHilvvEt8h8WdbnOp9gLMlby6DOYcNAMygW2g
	jwWRh/k2bRWXNja0LadtsXrEsdaScRfG/qnRNeECpcjwFfe+9Ci1L5qwrhAxncsZnYvglHvZHir
	lcjxYWzCm3AUxm2xypaS6T8HjPDjuOWsaO+uJNBieZsezRXRzrh3XI6fvu/Dr4nHbgy18OvttSh
	SDLRgiFYb/J3OwlcR2Mzq/ZEOsLj8dQm0jKveuffUIyA4oXVJYWlvvxpVSO+mrUoMSNF3+OKB1Y
	8Fe5MfmaR7PUHf4suJ6Oz5XirJFZDVN8uj9dq4wjJTYwvNQ0S7awFg4RPS8KcibQ==
X-Received: by 2002:a17:902:f687:b0:2db:2413:87d2 with SMTP id d9443c01a7336-2ddb1ac954dmr166648125ad.4.1790010227210;
        Mon, 21 Sep 2026 10:03:47 -0700 (PDT)
Received: from adi.. ([122.171.20.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b4a8dsm37103275ad.12.2026.09.21.10.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:03:44 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Mon, 21 Sep 2026 17:03:39 +0000
Message-ID: <20260921170339.1406-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arFL5SLHwLflaONc@stanley.mountain>
References: <arFL5SLHwLflaONc@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

Went and checked for the things you suggested.

Fixes tag: git blame shows this check hasn't been touched since the
original import, 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi
driver"). Added that in v2.

On MAX_BSSINFO_LEN: I couldn't find any rationale for 1000 anywhere
in the history - it's exactly as it was in the 2017 import, no
comment, no commit explaining it. Header (24) + MAX_IE_SZ (768) =
792, so there's already ~200 bytes of slack in the allocation beyond
what ies[] can actually hold. Looks like an arbitrary/conservative
number carried over from wherever this was ported from, not derived
from any struct size in this tree. My patch doesn't touch the
allocation, just tightens the check to match what ies[] can hold.

On the timestamp write - I don't think it's corrupting IE data,
though I get why it looks that way. network.ies[] isn't a pure IE
list despite the name - its declaration comment says "timestamp,
beacon interval, and capability information", and collect_bss_info()
confirms it: it memcpy's straight from the raw frame body right
after the header, so ies[0:8] is the captured TSF, ies[8:10] is
beacon_interval, ies[10:12] is capab_info, and actual variable IEs
start at offset 12 (matches _FIXED_IE_LENGTH_ used elsewhere in this
file). So the memcpy() followed by the timestamp write isn't
scribbling an IE entry - it's replacing the captured TSF (bytes 0-7)
with notify_timestamp = ktime_to_us(ktime_get_boottime()), while
beacon_interval/capab_info/IEs from the original capture stay
untouched. Order doesn't affect the result since it's the same 8
bytes either way.

That said, I'm not certain cfg80211 is fine getting a local boottime
value here instead of the AP's real TSF - if that's actually wrong
I'd like to understand why, I don't have full context on what
cfg80211_inform_bss_frame does with that field internally.

Thanks,
Adi
