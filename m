Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F93C4563
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101522; cv=none; b=QUoICJSYs0Yosn3054eKH8UX1dfa90ki9+uVCU5dNPnJRc48e7WSFWXxPIxBiu+m15S+aeG7VNObeCfR6gzwApmQYTS1geSpDO2uUiy8QBuQcPbKbuDqH1EqQj6rJPTJ46SoCDyOCWc5tjBFzEmTHOJLW7hB4v18jBaItiOTRks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101522; c=relaxed/simple;
	bh=PeiH9douFvc+HxIpB99pE1Gfd5/7tftG+WHI20aKOUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKL7bgQ+174s/570WER0MLcdaoD8J750T3PeVvHYOmss2FXOMwD8o7sAve597pU4DBEC2dpTH3pCLRZUgI/3VZU2DWL7qHRtxZmEbVhMn/54pygZuLb3rkoddTbj+nYh2ZAGbXEu4ZhC834mvFZklOpwsxAwuobaEduyiJQuEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBR0prLz; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBR0prLz"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a1888969ddso2955560eaf.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784101520; x=1784706320; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GhO1mJGgjWSe+KMt/J4uIGbAbNcsJnOSgG2JKrf7iyg=;
        b=BBR0prLz+ST+08KjU+4XLiqMXEifZKQYC36vTw5XY4MLTGWqBRxwTydM5axPhSMKP9
         mJ2u/Z0UnLYyKH8djecwgFGx3cKzlGMuW7Nna8iw0S9ZB/Ko/ltZKhHtFjtBfHCYZ/tS
         bRS9PoCXGqy06yjyJyowB/W5d8q4VZnTsvGTHtuHV+YiFkN9bi222DxyFRhJFv9FGL7y
         mZrXsFoZR1qpFT6DQYJYZe+dBvkmTZvIkM3CV1KwV2PcQVwcl0wccETX74h5HNAoaM2q
         2MQzSFInJ3BgSjIyyJHJ2wBY8vfjTzuXTlRS0jRfycefJuNwuAGFcZqE0M6+SaHBd2AT
         rVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101520; x=1784706320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhO1mJGgjWSe+KMt/J4uIGbAbNcsJnOSgG2JKrf7iyg=;
        b=AnmYHWGVeGcRCVsW5gIxPdlKOwTk8VkZ2qoqLZB8kTpuNMyCIQG0ytQeT/uDi2EV6O
         ls5qGtL9osbbHu+lSSAWPil6zS9G8GEToOm4YYa9HiBU/whzkDNJlZevFUT3QU2Tf9S1
         3Mpn7808ImDIKlByr2U+IEScTKDSn+cOfuA6CdqnoFYhnBWnRbszRFCEXLdVOi5+jITu
         aUVPGxT3FUeSQYjINf7fscdEgmqfiFimWRTWQpV9aeoABe9CC94J70W5VYM6vGEqkWdc
         hltLk2W5EVwVQYJMI8pCK0t0Wml+Oo/YIekw5vJ8X5dXSpHmXOwm48zoaXsOwbLELO7c
         OF0w==
X-Forwarded-Encrypted: i=1; AHgh+RroH686L96F8b3lrOLhAkrV0Cy0JrbSjdlNKtoWjXbdjQKsfXHubsbYrKbOCh63gSSqsfy/OxJ7ttPBwLt6@lists.linux.dev
X-Gm-Message-State: AOJu0YxadDCmdbMUpjK4pbdERQ8ft8TXZV6gVg7+io4xWkVmQxHKkD8v
	gbkdVRt9IvhITKaTPtLP43BYg90UMpW2G73pKoJ58QS7/pygsI5VYLyl
X-Gm-Gg: AfdE7clAGEQFbmTEi+smelQgXOak+3serCqFyJ2s0STYrC6p2ppNkFO1IwQbZ/kYF4b
	rBnRqhiG4Wb1YXad24l/OwRt4tzzj6XvfLrJSkD5HKYEiHHnsDXh27wrEiYUnV3aATFB7K1JxoO
	Y7FZArGUfQqJMoIToLuiz1v3Y2g3jL/cjryLn1q25KKAsTtKG4dQjuu39aX4JPJXUPAsbQrb5ug
	L5Oz+uD4zmc9FrKMEUEvKCuEYbdycEMUSA2mCWafwZgHIvCMUoEVNg9rIy6igD6gML8sDcivfuU
	O+mSDtzUJPyycLEZ7//fox29hODuJvVtY2a6skuADmSpP20lYaxfYrU/2vNZQTRTCt1Q8zSKOAB
	PYjg0VhkybHjJg8u7+/Cd5Ss2zQutPAjOh563mxw/RmVshUJzj+XlSc40tzGmFnpsOngD6YtpDm
	C33K1X
X-Received: by 2002:a05:6820:298f:b0:6a1:fd87:5325 with SMTP id 006d021491bc7-6a3cbae177cmr3271498eaf.19.1784101519915;
        Wed, 15 Jul 2026 00:45:19 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb262da7sm16673556a34.17.2026.07.15.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:45:18 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:45:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: William Elder <williamxelder@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: remove comparisons to boolean
 literals
Message-ID: <alc6hzi8Eb8LLRqx@stanley.mountain>
References: <2026070738-usual-rinse-7c52@gregkh>
 <20260714210843.72848-1-williamxelder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714210843.72848-1-williamxelder@gmail.com>

On Tue, Jul 14, 2026 at 03:08:43PM -0600, William Elder wrote:
> Remove comparisons to true and false as they are error prone.
> Use the idiomatic C forms instead. Removed a stray blank line

Don't mix "Removed a stray blank line" into unrelated changes.

> 
> Signed-off-by: William Elder <williamxelder@gmail.com>
> ---
> 
> v4: Per Greg's request, included all patch revisions and moved the
> version notes below the --- line
> v3: Fix inverted logic for ht_option checks
> v2: No changes, resent v1 as a mistake
> v1: Fix redundant boolean comparisons and introduce inverted logic on false conditions and removed a stray blank line

Please work against the latest staging-devel tree.

regards,
dan carpenter

