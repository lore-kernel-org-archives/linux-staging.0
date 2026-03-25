Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9765D31A072
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474498; cv=none; b=N4HWOlV1XBbo196ZPq9unPeerrA4MM4OsBzAZ8t4clWVfsxfpX+gtJo54Yik4FcD/sD4el9QZ1ygSGT2Qgp712774/bTxVkRLR/OANLX70dyYXyDexzgYd3lvnxkj3HFmh72lo9q7V959fw2YbNiUr31dq+X+NGX1GBiec79GiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474498; c=relaxed/simple;
	bh=ZQYFyxFfCiVFYjcUR80pgTmR9yPRGHtpS9PpvOl0IsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or0N/Ezk1G/QTNyUgz/tpj/KQOAgQE+TO8er1lZ3ofekHST+5yTCmGA+FlrJ7QdSCg65PQph9hOsdnVxL0Af5JADmjWZqi9XfKcHguyUxTDnyUS9D8sMavFwTzCA1NTL/18VwJCWtWxllH7hPmahCeBZ6l9Mgnu1dS1nzUyThBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTeyp7V7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTeyp7V7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486b9675d36so2859565e9.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774474495; x=1775079295; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aaERduj73kZVleeRSp8mEl5F7YmtzogBhrXc9iUxk2g=;
        b=eTeyp7V7MAfJNMvqqERwkt0Zz7vmX/x336aJeiuG/c0iSmLKy5h0tQVZWJA5Wt/1gT
         LVZTGG69Wa1bY9xcdfgOhVP7AmOgldpHkO4tiTChi468lMmZ1ijgEfgXpTBCtsp7xBvp
         JPoj8KaBhwzTEqjnvnd//2y084+nyH+qcjE/ZLt/dPLFIxLnTl15xwueXPQlpXP0XOo0
         DftPxL2/cgxgCAbPRBkXUN0w1KsEZvZeYB+VpHfe+FPJzwSEY5xvMVLMDw6yG81lzXLR
         F0hksOH/mdL4PCgTh/jlUqS03uee5PZlsii47qRAszfSZwxpZ8ZAJ+jfvUXPJ8vWdUlb
         BBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774474495; x=1775079295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaERduj73kZVleeRSp8mEl5F7YmtzogBhrXc9iUxk2g=;
        b=TWgN9HR5oi0uiGITSnNwZPWQF4fYkKqVYxCsCmXlsJU6bcEyYgoDcpY5J/YSEr0QRw
         DgrGJDPyXa7eDaJvCCU1MsK2LUdeWQAi4UBpHRKsaZ4k5JEq8ru1oFBLUesqM8FFW26E
         oJAkXBK6cU/rIHtpU0gmMhOh/kj1pISZQyzFWjLTzeJCwxgGQy7Fp75vSkSj9sHqDEZz
         ha/TEfO0DZYCkHWfqy1jAaKu94YvIcFE8BV6ibdpg2RuTF/hU4X7RK6UHGTzjA9Pu7NS
         uhUfS5MZ8x935B5smIUwUgUkOcu6HO+jj5JxhfcGQksFmBp6XWfIalAvzZpCudeQzTQB
         90/g==
X-Forwarded-Encrypted: i=1; AJvYcCWF9tbuJGwDVyNPFY0uSnLsxsKFnpj0L9XzHErgFcDouyKRJYjeIUvROjc++VWF+KVP0mHoPVe8CNdWYuA1@lists.linux.dev
X-Gm-Message-State: AOJu0Yys9GjcBk+HUkFi0uDZVASk9OdJCmFVM/fJuKxqqjCc+hPcgHoq
	dG9+WYypoujA9XNU1n+r6HCcKBB4LnK2tjLMpwQTFNxdibalIjf0EKMwzannXnXXVRg=
X-Gm-Gg: ATEYQzzYCFQ0JAj+Udj2HxmmdtLwx2b11prdf8Dkh/CNNNNMBiwGStN1o8hzEjKvI37
	Z8WaatT1KKQ86Wuz/mm6Pvb90lOjoBp2paU86fbW+tAkqcitCWyAS9x4AmXqfZfiCfc7B798CUN
	s5sdz+zlFZ0VCV08G7rJvTS27keIaghppEorSt0CIXNX1RqtKAdw5pvJrDpgDqRNx0V+15GYFJo
	rOvx9HK6KclTUBJ/2CO+huexwYtjzcklUWM8Tbkjjd3to6rjQwaOvpVxW4YrLTDIp5cq9fQ7rkR
	vnRUz5QM5Q/7aEuoRNydT/CrjbRhStWwFDogCaAl0OZqNf+ca5j7Dy9D4BOycQDqH6pT9+LNZMe
	mTzL4NGaoO5dfznOifVADk2D19n6iQ54WYGk8ILulhCnmDaZS25G3SS9Gp2ml+i5SYcJZzikatd
	x8TGgeAjyPVduZaPBvPdH/Zo8UCEA=
X-Received: by 2002:a05:600c:45c4:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-487160717d3mr75241795e9.32.1774474494591;
        Wed, 25 Mar 2026 14:34:54 -0700 (PDT)
Received: from localhost ([41.210.147.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm3404640f8f.10.2026.03.25.14.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 14:34:53 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:34:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Prithvi <activprithvi@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, lukagejak5@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <acRU-NKBqLe4-e3E@stanley.mountain>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
 <20260324135551.grth7jfjyoh5krzr@inspiron>
 <acKaP0Jz-VqfmEqj@ashevche-desk.local>
 <20260324160229.f46h25ebd2mxcfiq@inspiron>
 <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>
 <acONUF2nLAk6uhQs@stanley.mountain>
 <ea43143b-a880-4d15-9fd6-1a4a25abf187@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BvSJJhSL1hENOWF8"
Content-Disposition: inline
In-Reply-To: <ea43143b-a880-4d15-9fd6-1a4a25abf187@linuxfoundation.org>


--BvSJJhSL1hENOWF8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 11:57:38AM -0600, Shuah Khan wrote:
> My primary concern with this change is that it 10 files changed, with
> 26 insertions(+), 32 deletions(-)
> 
> It can be difficult to find any regressions unless the changes are
> tested. I understand it is staging repo, but if we relax the rules
> for staging irrespective of the scope of change, it becomes lot
> harder to find regressions later. We are essentially leaving the
> job of testing to users. Also if ans when the driver is pulled into
> mainline, it will inherit the regressions that crept in.
> 

To me this is a mechanical patch (basically automatic, flip the
if statement) from a newbie.  These kinds of patches are seldom a
problem.

I took a sample of the patches for five years from 2021 to the end of
2025.  We merged 54406 commits in staging.  We had 401 Fixes tags.  But
then I decided I don't care about Kconfig problems so I cut it down to
380 bugs.  Half of those (189 commits) were from when the driver was
merged.  We tend to not review code very much when it is first merged
to staging.  The other half (191 commits) were from us missing bugs
during review.  191 bugs over five years is 40 bugs per year.

I hand reviewed a bunch of the 191 commits.  It's mostly senior
developers and maintainers who introduce bugs.  They are normally doing
complicated things like adding features or re-working core parts of the
driver.  Quite a few of these patches were tested.

The fallout from newbie patches is pretty rare and often really
minor.  A common thing is "We deleted code but we didn't delete
everything."  The number of serious mess ups is probably just a
couple times per year out of the 40 total bugs per year.

I've attached my script so you can check yourself.  NEW means the
bug was introduced by a new driver.  OLD means, ideally it would
have been caught in review.

regards,
dan carpenter

--BvSJJhSL1hENOWF8
Content-Type: application/x-sh
Content-Disposition: attachment; filename="old_v_new.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/bash=0A=0A# set -e=0A=0ASTART=3D2021-01-01=0AEND=3D2026-01-01=0A=0AH=
ASHES_W_FIX=3D$(git log --no-merges --before=3D2026-01-01 --after=3D2021-01=
-01 --grep Fixes: --format=3D'%h' drivers/staging/)=0A=0Afor HASH in $HASHE=
S_W_FIX ; do=0A    # I don't care about Kconfigs=0A    if ! git log -1 --na=
me-only --format=3D'' $HASH | egrep -q '\.[ch]' ; then=0A        continue=
=0A    fi=0A=0A    # head -n1 so we only look at the first hash (lazy)=0A  =
  LINE=3D$(git log -1 $HASH | egrep '    Fixes:' | head -n1)=0A=0A    TAG=
=3D$(echo $LINE | cut -d : -f 2 | cut -d '(' -f 1)=0A    # a couple tags ar=
e bad.  check if they exist=0A    if ! git cat-file -e $TAG 2> /dev/null ; =
then=0A        continue=0A    fi=0A=0A    AUTHOR=3D$(git log -1 --format=3D=
'%an' $TAG)=0A=0A    if git log -1 --name-status $TAG | grep ^A | egrep '\.=
[ch]$' | grep -q "A" ; then=0A        echo NEW $HASH $LINE=0A    else=0A   =
     echo OLD $HASH $LINE=0A    fi=0Adone=0A=0A=0A
--BvSJJhSL1hENOWF8--
