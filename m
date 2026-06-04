Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC101A8F84
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560003; cv=none; b=tK+zhP5jydXdmVCNfP6YPy97SW91eQ7F/yRWGiaGSmFU0OW1VGDw4TIDaVwIsSJcxzCcchC/W9ztn+nTPxxgqw2YeL6yKAsu5aigv54REECYeJP4Dkv14EPLAy4TmTullu2OhQxyhvMSX636axiOIxXw0KXVCu1eDkZX/jP9zw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560003; c=relaxed/simple;
	bh=pyvpBySNof2P4AFNtUMMRUcnYxBjiroFzOjK7/u5M7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDM+w8OzSJF4yC3GQui/gPCsEg2ZooUBwf9RgWk3T+0PDbDw00OO0tTFMeKGx6PDQUtqlX7zBsDH4mAMnclUslhoCIKxPeI/pzmyT0zItayjEml48hEGEwADQ1CpD2DPEBMmxjjySculI6z45dZBex/O5ZHzQ1JbtxdPJow0nrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfrKDYXi; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfrKDYXi"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91591f19c30so75637485a.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 01:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780560002; x=1781164802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oygxAdSSs192vre1eZBfC4ed2lZJxHGD3rZsgt76Mtc=;
        b=jfrKDYXiH4QMk3WUGAq3yKfv2gy4baAs72Gd4J9ErigzkOJ22Y6on48jlX/gLlEdLb
         XAdg5ed0mIcaCGf/JzgAPuHA2NUhL8b4a9I9mxt/5iPatq+vymwVYfv9IITN6Hwso3i8
         7IVIN8CSEv1BKrOwEJOpkt06EDNqLNpf2n3Klh1P8pEgB4oXOwmET+AZrLefZloTmBfJ
         FA/0qqDJfqt3AN9Dh9mQp8MPZVfpng+nLN+UD7KQNQeYEpib5R9n3/yxjRBnVtpieBgr
         DEnkwyeM6H9gAkflVBsHG2iTYccHWhwgKz1jBkLxHo0Qk+fS2zRhbtgroQ6oL13KJ41C
         iSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560002; x=1781164802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oygxAdSSs192vre1eZBfC4ed2lZJxHGD3rZsgt76Mtc=;
        b=XCp6LdejN6+1pZ8jCLpuOBewAy6u4q+ENVuF5AktwEeULYiJ17PtqdUMppyDOEsjNw
         qIDSvKW5vtgqPG7fj+Ai0sct3wLfd+0GHdo1NhH1I6WMX0ra7/bDL5OgkTYlyLs8evI/
         6Vf4vPeNtoQ6c+oh3ruXwCL24V8/PlyVxHoFO+uYD9KFIaYtfCg+ogXdHQ23WjaedN40
         ak2SLgxuOlc044JSnov9VBdiOe6Z5pnUWKFPsKS6hGhB9licXPed6yWnlZ48fKNu0JMI
         ud53nIcbxVoIGgbdzg6cQ3jHaLZSj329Xwc6qd3zwX0+zl5xf6whyx9Y/DQmsjAQNqoy
         t0Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9neTEplp8h4AwdWRpdntZgJZ3cGigjQeszScR9rvNhE92CHo+G1/0eaEtcWw55acM050PPB0lH5Z7VZVcK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9p4a1HfYQD46LfZq2fouVSIZ4CGR3RMJ4A6d5dfBZrs9gO9hB
	hciaCvTdmedROXdwW32rk6FQo1SMMUZjuBrM/pYDLBiy8sqOGQQp3LWW
X-Gm-Gg: Acq92OG9PfX6iX8Yd2UXMO6Kf3s8xZdERWxXVpGwxplApZYBr0uC5ImvXwsB21fW3Ie
	Lqj10UphIODf5zsUXnM7b41KBdVVMKYN9dRVT3h3IgMlSpSh/e6W3h+ZYIuq87CJpteod/JoExG
	XouHutOIzpxAPHpuUGsM529eB/Qd8spCZ+k/j8duCmMZnd1i3RWgT76tpYBU2TN5r8W7cP+Gt0f
	CCPstHjfjv9bG77R9QWtMwtSDCLTkTQZ8fnbXcYrInQabZx5U9efUBU+zr0sCCgiQug+GyvcP3D
	evJ6AECUjWTOtcXnhrfcle67Ei65CjCXNXREIYDoKwhDr+q8eFZRYDKVgjsMHc/LRMSn+fmaJiB
	p7Gjg5hhuZA3I2Xom+yMQMcYxWyCMJla56i+ny4xx4dsXT0zOG1ZZKWeME0+H4QLue36b3uLDWA
	euDVlzdKpHyf97g0z8SV2BtYIEIjg=
X-Received: by 2002:a05:620a:f05:b0:915:9aa5:b5c6 with SMTP id af79cd13be357-9159aa5b72fmr470049585a.36.1780560001697;
        Thu, 04 Jun 2026 01:00:01 -0700 (PDT)
Received: from localhost ([149.40.50.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd077be8sm45590716d6.40.2026.06.04.00.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:00 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:59:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: William Elder <williamxelder@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove comparisons to boolean
 literals
Message-ID: <aiEwe3Ijva7hl1pH@stanley.mountain>
References: <20260603195239.200775-1-williamxelder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603195239.200775-1-williamxelder@gmail.com>

On Wed, Jun 03, 2026 at 01:52:39PM -0600, William Elder wrote:
> Remove comparisons to true and false as they are error prone.
> Use the idiomatic C forms instead
> v2: Fix inverted logic for ht_option checks

Nope.  Still buggy.

Please wait a day between resends.

There are other issues with this patch.  It needs to be split up.
v2 rules etc.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

