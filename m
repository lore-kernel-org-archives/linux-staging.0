Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235749F134
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052592; cv=none; b=SyH9/FqugDt3j7qXjd1kE/Kx+vQ8OYiucCNJ2VBrzhKnIlKUSTmjfYmB1rELobDVsRhIcWgtv8QarxNXldK2lIKPqoJ99yPIY+jYbNiiLVX6yq8zeVUcjuztJKtz+6Y1l4gz85QVEubwYkkNhC8V3+u0rZOloUU/kO11LZjHlzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052592; c=relaxed/simple;
	bh=4kjGyemxArxxhc3VTMbOFpJbiKYGbVIDU2MSJN9ZDHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYzq1hgkV/fRJk4ub3Vu+2rd3lV0essZsAEld00i8PfyJwX40RIsVA+/LwbNApWrCg20Slm4dtsTxomUaA8/FSosEW0RPoQjwTX3eQoMlg+uivHgkQqBj60BQBUf1Rrv+9ybIa5e7yWngiQprGfehAVpFqPT1/cMwMaHmShQHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZADJ6rK; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZADJ6rK"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-46adfc80ff6so4500782fac.2
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052590; x=1789657390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8whDIqBhsAHgrrO6NDVanhr5yk0i6lWH6hgEmhFdyNQ=;
        b=eZADJ6rK4ynRR+jwo6EKX/4dIpR1oq2AS4wHljgqj42O/pSxpHlE/oZh5eeEOts+Pf
         3Iq3joDftdEswz3G552rxESZnkkPBXr8qjPQSkex5S4miTalUYh5Mj4D+5sY6down1u1
         C2my2SZIIIGRbf3yP/A66MFZHczRlIuWJjUknWLtnUZxGQxSt9Lpx745qJgJAhxMn6+D
         Gyyajc5pdNFlhSwSZSiz6y1xIPWu+MgwhZcxRjwZmWRKSGDruJj1BmRKWfI9jDscO9xb
         hNTe7rN19puzmbjAcMrWKnD+YMyputM9rh8opng3q6scVnKemuH/rk7Qlm3lf7tN4ymg
         UNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052590; x=1789657390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8whDIqBhsAHgrrO6NDVanhr5yk0i6lWH6hgEmhFdyNQ=;
        b=HG3pSenQK4MsnZfbu3zuaxq2se7H39NNbWeFoNm+8U8Uss4pk16b6fZzzGNy31ghus
         e1KtWAB11lakjPHhFGXYCi2J8b/Mwn/15/NJ2sFj/MatE/hfIalHYj755sutvxmK+/pF
         i5Bo6hm/ezLrEUe3iaiiMAYxyp2WxVlHGmWaCg0MHkJIKOY+J5rTWmiacFaEorZ4rP/r
         dO9QfHt8/o0iea4Dcpp8HWa26MdtUPVfht8iKpNiy1R9soOMzGgar65qPMBJFUsz5Hy/
         77eaHSiHAIJVar2FmyfhDSiTzCPS+72fieTqUDBX/EfRUmn7PG/NEUGTNOjh7JNQNhGN
         8gyQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ7IkUg1OXr3I7Kz9qgxXmiCCRzIqt3nUe0WlyUf8UoCF+5yECw2U+zw2qBbnWctN4bBntp/dbhoOQvWKh@lists.linux.dev
X-Gm-Message-State: AFuF++lZ/sO5ek97CohYh63zcwaTbQwIgflsrmHFNCTopMYrTae6iP32
	VwdD6mSwc61wkYw7+uGzSF3Oo5VsEBDlsDfbPasrgWYWF2rUK0brHK5q
X-Gm-Gg: AYBFou1QhNWrFoAS3ZsS/Fy2lkQeCsBLzX1Xz5Zuq8L2RVNze26AADi0TKQCTIyENKJ
	SLY08KeqxtMJZZ74+Cf19Kpz/YsqtsOewX1fR6xMy4a3N4DgUPE2T8lwFTCdPVScHVyv1z0aTij
	2ga6adg1Kx7oHaT8GcIpsx1VauOVGzkWWp45dCwMb9NrzosvQAAj1NpRiDQqskGlMZXTMdjqog6
	fMC0x8VtltP+aUlSeupjt8XVJUknbBhpAWda3ougRoMeBRVW3QMgvBF77Ax6PPE0fDLStcz3o0g
	qv6+AOTnkD2lBKZre9Bmu7jQzD4U8Y6/RrEvxSreMXfYWrZtxhR71KLdD1cf/VICXEnLh1I3xeh
	hyvf/vZlSK6CvH1NxqVu7g/e8reTMEvkZtO8ladogwWPP2w7IyHNaa3xwSOGr6+bMw5lRMpC/SB
	+j1rh4smD3jlIu6ifEdHI1Wj96eA3wzi31o3ffE+BgOGemJcSu7orx6Xo8LdYq69IHlZAWtd1vt
	FxfbPj+2OAGxXw=
X-Received: by 2002:a05:6820:1f03:b0:6bd:d2ad:55a1 with SMTP id 006d021491bc7-6bdd2ad62a0mr7279865eaf.9.1789052589688;
        Thu, 10 Sep 2026 08:03:09 -0700 (PDT)
Received: from ASUS-TUF-Gaming-F15 ([49.205.200.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-336c2571039sm31536449eec.25.2026.09.10.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:33:00 +0530
From: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: camera: Fix function declaration
 alignment
Message-ID: <aqLGpAmMRRwQiTwl@ASUS-TUF-Gaming-F15>
References: <20260908171011.4122-1-tarun.k.lywait@gmail.com>
 <2026090928-playtime-carwash-eb07@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026090928-playtime-carwash-eb07@gregkh>

> That does not look correct at all, what tool asked you to make this type
> of change?

I used the checkpatch script itself (./scripts/checkpatch.pl). At first, it showed me the following issue:

CHECK: Alignment should match open parenthesis
#267: FILE: drivers/staging/greybus/camera.c:267:
+static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
+               struct gb_camera_configure_streams_response *resp,

So I fixed the alignment as follows:

static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
                                                               struct gb_camera_configure_streams_response *resp,
                                                               unsigned int nstreams)

But after making this change, I ran the script again and found another issue popping up, replacing the earlier issue:

CHECK: line length of 113 exceeds 100 columns
#267: FILE: drivers/staging/greybus/camera.c:267:
+                                                             struct gb_camera_configure_streams_response *resp,

So, I finally ended up with the current patch, that didn't raise any issue pertaining to this, when running the checkpatch script.

Please let me know in case of further queries.

Thanks,
Tarun Lywait
