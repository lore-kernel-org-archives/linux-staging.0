Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844B54AB1C2
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004205; cv=none; b=F/zNqU27M54J9bEKQ1Dw5DsiGnBuykzQNSxlQ2PNA1Mk3QG/6DZDOIcZVmJ2fQeZy9HCHlyD7k8U7WarWKVg2Q7AUiXpfksLF0pl1+d8xnaKO2kZXHb7k9FhG4SlClBptodzIYHnD74XQJfP7i97HvlNmsr6yw2N7ubwkHaUpzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004205; c=relaxed/simple;
	bh=OscC8DrQb9ORVJ8oYAGZZEW+xZwE9Iz53Q4Np9Y2sXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwuW6PFEkdr5i43Om54Hv/IpmzGwN+b4Pptb8CaOwfw3Fx1eMkyZtnPNWRcORxan1aXojhTnglyEldKmlRsn799BvFAfL5mjGVmwMoUmdQh688fRkHeclNvw1afmzaG6uwRIdO58da6cwLTh+1FEI+MN0NVMN1sSArJdGQPR5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FP7ZmFdx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FP7ZmFdx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e2406so16235715e9.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004202; x=1790609002; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qq+7QrXS/k7a5MVGzG9IfQdtOA6kqjAnM3OlZxIizdc=;
        b=FP7ZmFdxap/ZkqcQfXAEm1YZnk0CKmGtrXQbEVUAZTDO3rGpZBCXfk3a0rgCJoTwWE
         Y4W2LIt5i7fxML251fcnlbPoDIb3bc4KwEJjQsebM0kEe8WibXEul5m/JaxHbu5sJpvI
         ql3PtM2akoiM9l+nVUxi1KjBHaCOOjhdEFXZFiWgsgS2WhJVbWiY/S7WqaRv+QoEvK0u
         FnHMCG+Nk8lxFgSJHCqaJpnC9G0HHzdbnPyuIJC5whxvG2rLaokbB9U4wyteDVDX79aF
         kENC8etK4kqWfEHqtQ7cNw1fpfI/LcFlVSrJzyhElVZhZGQT1wEb1KnpKTogecQCRQyu
         0REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004202; x=1790609002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qq+7QrXS/k7a5MVGzG9IfQdtOA6kqjAnM3OlZxIizdc=;
        b=T+HURw2+1d5mSLzMdensrWC9AX7avDDGGogbPWjDLUGiEpMDC3tliGhfF+RV7I4QzQ
         pBJ/XotEoD+GCgYSSjtb/kIC1uCFmpW4xtAZFXzlWdXdA0wqNzL6GZOA3d+tbif0mYVf
         nk03H9naNitDchE8Su+17NmpZaACZWTKv5Ie+cyJiHuJ2hjBZL4WcXVqZ9mqy/ZvJar4
         wtgPBBIiMcTPDRI1OEBcQzY4RsFduXM5w82j1XyLdpXn0KQcIy3Rbwtn2XFQ8PHQrD0o
         VY0BTSlQX06FPmPsSMikul+J8JKxuCPcmN2Gsf5ZErw7xTF2hSobktDelUUQlGkNTmPR
         rhsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4l44ShLAYmA+B3QzCW6KeganQntnwEBT+298gjLZ9HbIqYrw2z2mtez/o5NlIOkrT2BMwqdzd+q7p2Q6T@lists.linux.dev
X-Gm-Message-State: AFuF++n1kQFJnh95ysAOpvW8KQ7F8Qb7sWOuv81ax/458ogWZFX3jEX+
	CcHA6Qf8P2P46196v8dUZwaxd176E2RLwgmjS430r4lnOXOj455eOmHE
X-Gm-Gg: AYBFou2YpODUeJrlKLbpoKT1zkRmBMctMdW2EadcK6qziPho2uzr9GV1J+LrQj/CHlb
	mSuX6Nhp0aMVJaT8kQogfdReLJvG6R17aoCLdfeWJPjTSQpdq6L5/gbJQyrdaDz+DO6pU+ri9A/
	T7sLj4RZayH/FphQ7Yd1kdPm+YRO9+JXXElqPBEmOGNGwVcLoAZLelQmeUL8ktmmcLzas+hGB4L
	7P82nuxPzY22PDx6Ju8JlpSloDLfFfiSqSY5a2vNPBFk5J56LleP2XjH3Dvpv1g7a3EQEMLKqE8
	U0+TQQcRK28SBPpxUzOI8sP7byYtO/1vmkisKDBtFqLbuYM0pdkoTM7NSMDeOrq9jO35k0H1CjP
	S6KZmlzzN8gF/p/wnOB7+0NauKrSQDRT80F8morRu3Jw4WIYXvPPYWZQ3HO4qhqldyegSWWaaPs
	a83GGx29tYOReCRf9+lZ6OHh/zU1i8KTaNT7ZN/G8wSWyN7+TWuezY82NwfQ5dfZbRU4c=
X-Received: by 2002:a05:600c:310d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fc4f85891mr183159525e9.5.1790004201571;
        Mon, 21 Sep 2026 08:23:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ec1e63sm206536025e9.0.2026.09.21.08.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:23:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 18:23:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <arFL5SLHwLflaONc@stanley.mountain>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920142849.294162-1-itsadi2409@gmail.com>

On Sun, Sep 20, 2026 at 02:28:49PM +0000, Adi Prasan wrote:
> The buffer bound check in rtw_cfg80211_inform_bss() only verifies
> that bssinf_len (ie_length + header size) does not exceed
> MAX_BSSINFO_LEN (1000 bytes), but network.ies[] is only MAX_IE_SZ
> (768) bytes. This allows ie_length values up to ~976 bytes to pass
> the check while a subsequent memcpy() from network.ies still reads
> only 768 valid bytes, and other paths that write to network.ies
> consistently cap ie_length to MAX_IE_SZ.
> 
> Add an explicit check against MAX_IE_SZ so the bound matches the
> actual size of network.ies.
> 
> Signed-off-by: Adi Prasan <itsadi2409@gmail.com>

This needs a Fixes tag.

The original code seems like a bounds check on the destination.
Your code adds a separate bounds check on the read buffer.

Why do we even have the MAX_BSSINFO_LEN limit?  What's that based
on?  1000 seems like a very suspicious number to me.  It's a normal
enough number for humans, but it's a strange number when we're adding
up struct sizes.  Do we ever need the whole buffer?  (These questions
are basically rephrasing the same question.  I'm assuming everyone
just feeds them to AI, and I'm trying to learn who to do prompt
engineering).

It wouldn't surprise me if there was a different read check on the
source buffer.

The other question for me is:

   304          memcpy(pbuf, pnetwork->network.ies, pnetwork->network.ie_length);
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We copy the network.ies entries to pbuf

   305          len += pnetwork->network.ie_length;
   306  
   307          *((__le64 *)pbuf) = cpu_to_le64(notify_timestamp);
                ^^^^^^^^^^^^^^^^^
And then scribble over the first entry.  That doesn't make sense.
Should the timestamp go before or after the entries?  Review the
git log and other implementations of the the realtek wireless drivers
to check.

regards,
dan carpenter

