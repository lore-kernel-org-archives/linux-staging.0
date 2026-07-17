Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311633F6C29
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289029; cv=none; b=MNYX7teO/qp+LGKVYVMX5MYOnEGJ8DgY+qrcVUw+fUFmcYBKYtezez/VtkHP+t8wi/RLqSkWxMVVzmi2vdL3LP2CQrLsHd+agX7IggMQt1irojecLI6FKrpl9A9Rgqy+6FCxSuJMPiy2qIo+sDnAfVkrQ7zSLpZC6jqv2ReX0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289029; c=relaxed/simple;
	bh=NOZZYuhxHF53xSIOtY6kopoSY2UWRsXC151GycTD378=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaNn2OFFMOCK4mZzgBO1hUgUBb0enWXtkYPylJZISDoQ8OPGYFv+TZszcc4wdr04TvUZ1K18tD1F65zq4vH0O7vhbxKGBWFD6FbsCxHjJwgchhAlgBMKDE6C4NHSAnbX2oJHXyRpLPQJSM+XydiGk39gPShwDYbpLjjLQnvRa9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrKCZh8P; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrKCZh8P"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9f829d75aso2797216a34.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 04:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784289024; x=1784893824; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Trwfl3haxYHN93JlJ/urlVTQWvD0ALsq+DP5zD9i6XQ=;
        b=WrKCZh8PEM4/rNFKg1AyPq3k5CA8WwlJqHzlyEkMzlJpvJAPH1pLOOCWHN7HlosGDH
         T0/HbQ9uKyEah1YCFwVFdt5VoTFCl47IAd+i+U4rfmd7tny6wCtztY31skiMleZ6AK06
         HS8jDvvUulSbv+65tAExw1gvg4PHhxTXyj800Ov9gsMzN6QaSEH2UGktvdEMcN+GV6Rd
         JZZYTrpC6yr1Onkqn080hAhmOm6ctgH0A3ViIdLpYo1ePgckwc84x842D2Ys30/oXypu
         jqjpjlymgdMAdKmtkKEo3s/22PyxLFLTAZexY+hUjUvLthdkDKn+3E7EZfY6pWmJTKuY
         9SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289024; x=1784893824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Trwfl3haxYHN93JlJ/urlVTQWvD0ALsq+DP5zD9i6XQ=;
        b=k3rwgnExiODNsK2VUoNoT0DsiQmYt92/0ShQlBBZVTZbOTOrC4hBlb6qUi24VWVosZ
         oix+yLpraGUhj+zJ8OojJ/U6nhP6GYTZwZ+x8ZSdr5LE+FyKU+uo3ikRTPvqXi+NeHLw
         sKomtlMeJ1GPjOfV2zhLB94pzvtqfIXAsFaaPnwSTAxmoPE+DSFw8OdDYwkbw5P/Iu5s
         0Ih0e78Mm9wjo25SX6cYMGhewBIuoIbQ9yMkmZntACvcO92hl5Tcq2tm0L+6xnE0XJhr
         fsSRk6dB2fi3uQO0NSM9YRjBN+yZtntgKsgJ8mNb6vmi0eYbYWeIrGIkSxUKVaFkbLk6
         I/fA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7fU/sysebTZec5gxHWY/UQV/p3DwfcfCR/vRDb9/fc5JVueWIn62GblVoEWqyhmk6t5mkIv0YFAzHZZOd@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0YoGsF4q4KbwStmUZ3XG1wKLslX1+w3ov4sJPxQlkDszbCml/
	etCsqRHD2v72LKbFTgFDNaG0oZYvn5NTSHRuXl+K1Jkgf/A3Eu1XcYCs
X-Gm-Gg: AfdE7cmM9UPZA1amd3pC15j9dk/5mPMTevQ/o9hWmqq/qtCQ8aJEaNvCSF5tXtHVbb5
	TRNtqQTYJ6JrjWyhxT75BEgcR9z2vAE232DLcejQoJm5nMUG5anBGUZ1v2vQ5jnwlNOO1Sop7FQ
	PbD7Ss/Tm5bymDkh5s3O3+Cs0Yeeg0G99EdlIMnK6tLWMfq0Gm5SAq5korYtxyycTPzoaHGC8Wp
	lMgMMdzqPhu3zmQbJLuVxL8nlYouIFA8RKuop7Hfb+dCwu3X0fr9h1Lb1Gz6h+8vkklDgGekduo
	XpkdRrFGRtcl1QMDKBbxUwEbIx/6JcN7akxEOedOln+uKkKpLbmAqmxizs2sQol4Z1QVmkhBgMm
	bjS60hLZqp+1yD7zz+WXGmwqwsqLHlX02ODy8VRVUiznYAfpZfWI61+lJH7x4dqzxz0KaqQ==
X-Received: by 2002:a05:6830:7101:b0:7e9:b4d0:53a5 with SMTP id 46e09a7af769-7eda15301eemr1183450a34.30.1784289023967;
        Fri, 17 Jul 2026 04:50:23 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad98ab3dsm1046368a34.12.2026.07.17.04.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:50:21 -0700 (PDT)
Date: Fri, 17 Jul 2026 14:50:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mariano Baragiola <mbaragiola@linux.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: validate monitor transmit frame
 lengths
Message-ID: <aloW93Nb_A9JtUfh@stanley.mountain>
References: <20260715225938.1403192-1-mbaragiola@linux.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715225938.1403192-1-mbaragiola@linux.com>

On Wed, Jul 15, 2026 at 07:59:38PM -0300, Mariano Baragiola wrote:
> rtw_cfg80211_monitor_if_xmit_entry() removes the radiotap header and
> then reads the 802.11 frame control field without checking that a base
> 802.11 header remains.
> 
> The data path also pulls the calculated 802.11, QoS and SNAP header
> span before confirming that the skb contains it. A truncated frame can
> therefore cause out-of-bounds reads or leave insufficient data for the
> Ethernet address writes.
> 
> Reject frames that do not contain the base 802.11 header and data
> frames that do not contain their complete calculated header span.
> 
> Signed-off-by: Mariano Baragiola <mbaragiola@linux.com>
> ---

Looks reasonable.  Please add a Fixes tag.

regards,
dan carpenter

