Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752249;
	b=MQuiuyrqYD/nY6PzAADuF8RdmcoTR025aNBtJ5OsQOhsBjErrQTJ2gP7qIiDb0b4ccmX
	 BS805qmiMVaoskdH+dVE2uAyeBcqsnHk8As6dx5dqdp10GKHQbL8+Ozyo0lLfsSCEV99t
	 sezv20oqQiAhminwPBX6K2mIWxrwa9yLyqYTdQky4LQ1ylq1J8vi9VIkPYMu2smO+hYiN
	 1FGGqZ26pZXK1KtXma/M4Y/jkC69Ky0QQFCCdvPfqR366+hev81q2iRdRLGT/+JWdQSsp
	 S9HaOAKle8dR+77syX9vYulJDgRaP/MGkibkLm/UzyMDoxkmZJTG9lqMY1r4Oi8rh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j13J37zaRLVnSoEsPhtFLUTrQib/jdWNau8tT8thTlE=;
	b=omxP/HXF/cLhLl5gBWhVy4SwzCgW0dItGz6ncMd49nX66yZEryoMjx0+zWeSafYmHRXB
	 C+DqponNKTyPsm2Oyi+R1wYXoytFqV3CFassU67kXElBulmo5nnc9EDkUHRslsyCLGfrN
	 4DTDOuMyVXLaip4nTeVI3W4HHHKc4HNFIpjrLyPnUUO4ddeUHzyKMHcXLPhvTSuqzLe27
	 py9hKZPXw6UqjaJSfHXZTtWud60CFiYW0gegRYR7p4UvMJmsj+VXrcPv9+EZWfqf5PqA/
	 SjFBPD3WUamHD8H+rFkw+NWXJoFvLXxIRU8GCx+zcryI+VcQy7t/QoM3a5Lhuk2fSdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZeVOFn6C;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF5606A322
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 10:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEF5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZeVOFn6C
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so6464705e9.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 03:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752248; x=1793357048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j13J37zaRLVnSoEsPhtFLUTrQib/jdWNau8tT8thTlE=;
        b=ZeVOFn6CRgmzkUV4BZo5ZINNzIuPzejR2r7EJC3LZ4eD73ayFqikjl3ZzK8e5B1Ivv
         EYnfumEkGnigw9h0+c3ca1NZg1UqUoVfltbEFimmWd5eXS6kzBFwBsLnqmXGbS6plwt8
         lNLW+ap3DWyaMWHNAvmdpUKNSAktEFGoORm6Y9zTxuzYdqJ+RmkL2U16WipzrlqlAOfZ
         r3sLxGdTIeNFo7W81q4Ki3uJzKNbfjlLTqbzjXmcVrNUwq6JEqu3qxWYYwYam7351Drh
         aFnU9O3KUp/X+B6URPNWcwAoZtoumtAMzgO7gfCRAoKARTfvBD3vg3nszlVCNn8cgHdv
         PLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752248; x=1793357048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j13J37zaRLVnSoEsPhtFLUTrQib/jdWNau8tT8thTlE=;
        b=dH+wlsRwvyuodrDdjntXi3WB+sMssEtV9S4DgcMova97OG0hA6HOF+6tgrpzItdYPN
         nFrFNuIIDfPhuI7Cv0ubHYELEe3hjA3VV6eoAsjrZRKW+3HGVR7ZAIl//2uq+11802FC
         OA6SjAtoR2EbOGl4UT9PYVQhePnhkbWCh9l10q6f3OV3FSPzIAAw1m2LJeXWRF6mIhG2
         5Z6A22Q61s8SNCuG+AGlE52rsNQRutFd4ffxmgZ+Lk6uFVqVxTSfWZmGMvoldEuYhz2n
         AEmVxxs3uX9skeNuBcMTmY7hhQKzOHTsKABkD90KfLGQ9NbBPbvLUbaNVnCsf3lYYMMX
         QwUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0UqqRg4jCdpIf37R8XpmvaWb9wmDVAoHjGtjRLKbYMBE6HBUb1P5wTVbOoiwNolVMpplJCE0xeu8vh8Qx@lists.linux.dev
X-Gm-Message-State: AFq9FYJ5Q4MGqXOotsMWPK+ZUw2N0BILQvkU41scJLEIsj4jiTU5bAqF
	MTYovC9MY4wBxw00UQpUJhIDTNw3Gk/BDI5msJ2l9wyb2PTtKFTsdgj+
X-Gm-Gg: AYBFou00twUZgs0Mj94mEOvEi4WeTmgL5iOja2YLk/0Z+VRS7pGyWCe27eJRIpFZP4K
	x9sqDEkfPXVxo3RnorKjmppL3Sqw2zkLks2GQQ+EiMXzxiFpiSJe7ijw6iHVGBNTiepDGa7nRgI
	BbrIQV9psuKR+a/gOGE/qfiYyKFE12kIpbSVDA78BO/buDmKnJ2oIOV+pVgd/QD7SkNi+yD6qx9
	79PcS9+CXp91oa3CKhdpcaeFy3Z7axxb/wZgPBt48uHZsXUrpxSZg0+Zd8qstxSuwRdh8E3nHKo
	z7vpnX77nrhPFeJGc0iQDNETtXLiyy1scwT77pwYbwDaGog0HAAX5iEvkPwu5EdTY+8N/m3TTDr
	i5LWAZH1iSU7BZaBgqmBEcRawbx958kgDA7o4QKwrXGkBuKSpKdt+FiPXRMI5tZ8x+bGLGRBVEM
	3BQgVby2SD6d9KPTKGMibWmb5w3sehj3Q/JnDORzDmQkATfINnGbyeJIOEbcysnzRdd1QRiTavj
	/uIEyMcKjopdrasyGTEh39lNydfhB0dQLxXVi4cDVUA8x315ilv
X-Received: by 2002:a05:600c:314f:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a211ed3908mr26418105e9.23.1792752247565;
        Fri, 23 Oct 2026 03:44:07 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215418d9csm20423895e9.2.2026.10.23.03.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:44:06 -0700 (PDT)
Date: Fri, 23 Oct 2026 13:44:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: axis-fifo: remove unused r_mem local variable
Message-ID: <ats6crcniknWB9ry@stanley.mountain>
References: <2026102337-headroom-shun-9d45@gregkh>
 <20261023103943.20995-1-breno3011alves@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023103943.20995-1-breno3011alves@gmail.com>

On Fri, Oct 23, 2026 at 07:39:43AM -0300, Breno Rodrigues Alves wrote:
> Remove 'struct resource *r_mem' from axis_fifo_probe().  It is filled
> in by devm_platform_get_and_ioremap_resource() but never read; pass
> NULL instead.
> 
> This is v2 of a three-change series.  The debugfs_create_dir() check
> was dropped because debugfs has handled ERR_PTR parents gracefully
> since 2019 (thanks Greg and Dan for the correction).  The
> -EINVAL -> -ENOBUFS change was dropped as well, after Dan Carpenter
> noted that -EINVAL is the common errno for this path and that he
> would leave the choice to the author.

This kind of meta commentary goes below the --- cut off line

> 
> Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
> ---
  ^^^
here.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

As always wait until tomorrow to send v3.

regards,
dan carpenter

