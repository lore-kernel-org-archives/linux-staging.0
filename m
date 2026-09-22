Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD851EDE7
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063301; cv=none; b=nOiONJHDL21dzeQhy5TnMOb813T89vUrjSC2jXNos1FP/ZaXBSCE2shf8L+K0U3K0eh5XIRXqjmffEwMvnV5GJYW0Nvb8VC0Ie5dPY1JzIoQzJPAHyFEoObq2wSM6vkQUvcsLS1DqO9qKHcNP4YTNvEDRQyfCX6B6Jh9+fkllZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063301; c=relaxed/simple;
	bh=ZejWtrMd7d7zk/DfmXTbF2uTpVeSWdaH74FgmGezb/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6a4YTqtRaXklmSPWlkYAdm7wXwWs2CSxaWl1m+MheOKQkjx0hPcJEnKWI1BO0fXDDpjsRYa5lm1bDDUghJi+y6M8aRDZ7ecmz3O3lCVNhq/ELSmaR8efOXT2dB128GyysSXDN2stRw3UmzMGtNivpPfjXWZrbtl41q2Llzfuao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQZwwCV2; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQZwwCV2"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so3313121f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790063293; x=1790668093; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mjk7K+afSw9HdUE3zJGs7MlLHjf2HtEjytCSGhTjHcs=;
        b=LQZwwCV2zpqKfmj79xIHUeiA9algsIg312ZXw2mW7rd60UfjaiOgrp7PnItCakIzL2
         CheoprweuD1Qgv3jtzngL0Xh2/M8sL1b6rIDx/8whApuGeIaivUQR/ldmDtSULX4M6ZM
         UTgd8rPdJZ5bgC/J82hZS7QzpWqEqy1zDjr8SVOEThSJZ1uRHLbYRg667rSlbdhiIkKw
         KPTNB+lsJRuQZ6eLf94ejQATTPJutxdwkUZx953SV998ZxKzBplhMbKRjR0pUjMee2Kq
         nmgzJzJ50BDyjfQg2QUYUnmAnExos1WA07w+Yx3sbvOKYewZu2iIyHfX0OvW6qKI/aE2
         9G5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063293; x=1790668093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mjk7K+afSw9HdUE3zJGs7MlLHjf2HtEjytCSGhTjHcs=;
        b=LF97oeBweLCvxua2UZDS+aLdjv+vcD94R7O3adJWBNFu3aE4nsqu4aRymQODYz99tW
         pXsA46uP8+rfG5xgKbb8vv2sW1K2T6sz3mEtooRwy2aOyznyij1xjYaGUNW/usUC1Z9J
         sHKOVProm1i/Toses9KO84uOrnT0harRtikoG1pDcdAirhtExR0NGh0QUHRTq73fzksV
         HnB2ikGOq6OYMXvu0/7tbVwS+gc8FtUihGBK/R2sVyFgkN7LsitZJkDuZwGwHCmTYekz
         Z7SQj+BQ1RiPiXHNbjeChxUdD/Wdkd9JcD6y66zU28NPfRseATjm56R1wU6pXRn19aTe
         SG5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7duib87V827Lf9XRqxiY3aCuXceEmdrEwswXEv4yhO+aIaLxPY3dTqHqMEBunutKmK1mYEswUm2r3Npbr@lists.linux.dev
X-Gm-Message-State: AFuF++lYNk81iKxdh/p1If9AlGsQ/JbD08T/Tdt1s+FX+XHlcANzfbx4
	a+gQ0k7sUJXrpbpn9yA2xv5bgk4m+XZDnVQ6J9L303UvBlENvI/H97d8
X-Gm-Gg: AYBFou2Izgo+s+676BxsAycT4+pGgh2zaz5ei507v6x64BTUEA2RazD+qgfRo9EEeyA
	QJGjDMsWeUPOdBBc45hO8SVgSqRTEmxo5ein6R7WD5IGkqAGTKu3wooNptJ2MZjQPBSx8ayyLXW
	6wqECWE8Oy0haLESNXZtOzHbdNXbGySxzV6YaNZlCF3XLJoM4LaUPla1RSSesrmO5eu+LJwCaYM
	F9cQBsfJNtYpKakb+9hQEK4OqlI6AIkPS1FqCPKzzNG4L7djd6dvtRJfqgAbkW02bx6DLH71zSx
	JAcHkp2BaT0SUX2FTBM5MtfgIuOVUDMPUe8vQ2Zrtd7EpVy28ixDl0sSJFCg4tZKMpRWnvHAgDY
	Klii6I0h17vT23JFzcWc/XJqJtz1WiNkuB3+uvORscaCpHtFPIvhwdD6ynVPSl5I1RokPIs+PbW
	zmsororRIcOqOxrf91nJnTSrt1JNhBIl+KBcOfZ3e1gGIgtCW31sJTM7lvEBkDkjz7JAw=
X-Received: by 2002:a05:600c:a4c:b0:49f:d71f:9a39 with SMTP id 5b1f17b1804b1-49fd71f9a7bmr53039255e9.1.1790063293066;
        Tue, 22 Sep 2026 00:48:13 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fda8f04f7sm48750945e9.0.2026.09.22.00.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:48:12 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:48:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <arIyuBbtRu2lwitr@stanley.mountain>
References: <arFL5SLHwLflaONc@stanley.mountain>
 <20260921170339.1406-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921170339.1406-1-itsadi2409@gmail.com>

On Mon, Sep 21, 2026 at 05:03:39PM +0000, Adi Prasan wrote:
> Hi Dan,
> 
> Went and checked for the things you suggested.
> 
> Fixes tag: git blame shows this check hasn't been touched since the
> original import, 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi
> driver"). Added that in v2.
> 
> On MAX_BSSINFO_LEN: I couldn't find any rationale for 1000 anywhere
> in the history - it's exactly as it was in the 2017 import, no
> comment, no commit explaining it. Header (24) + MAX_IE_SZ (768) =
> 792, so there's already ~200 bytes of slack in the allocation beyond
> what ies[] can actually hold. Looks like an arbitrary/conservative
> number carried over from wherever this was ported from, not derived
> from any struct size in this tree. My patch doesn't touch the
> allocation, just tightens the check to match what ies[] can hold.

Try to find a better limit.

> 
> On the timestamp write - I don't think it's corrupting IE data,

Sorry, never mind.  I was looking at the wrong struct...

regards,
dan carpenter

