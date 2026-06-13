Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A40215075
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 06:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781331319; cv=none; b=Q+R9TMnr4LrR4jncZFAjta9oePew1HDaoSTqZycwohfRMg23T5qTZ8XoVIpQwx80y6HB9hZrD/wQOjs/igBo36MZ5ptt2CfVB22+qRycPZ9iy/2kD0mwbIvBXct1IxIDErRcPRStEK668jzw1cLZvD4NLQjiIPXOKnrGGG/pU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781331319; c=relaxed/simple;
	bh=kvgu2pwMGJHdiz92AYeJ3+oJ29XoTJnTSAyWyiLRUiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiPJtq7lIjiIH2EOV8DAVYgpj24aIe8vs/H67cFkvhndlivTZ+lG9YjFs5HUjA2lwxe06ndES5dqk0x5cR+lVkUh5WVsTdsZpHNj0IYrKk3VjrlXX4p/pibYXv3imNYa+cDtYZcsqqxAjsl9WegiSStHWCJdK8QfV7fyGAHi+vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJFkuzWD; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJFkuzWD"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9159951f05aso187900785a.0
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 23:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781331317; x=1781936117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Biw74RXDhRrXl/+hvcvrUJ20txGwKAJRoRdTi99B8aw=;
        b=RJFkuzWDgxHkXiUU6g3t6rXMMjUJGRYRy7XP1zYkbktPTmAyaqh788u9sSLhNXiCxK
         88A/ih/LicgSH1Cy9KeG9usxveM8IrQBJb6THpsp4CZNtP1gbBPkaQutzqKQDw4IREwL
         KoczWuQCnu01gAH70MtSJ2D3g8AYKJFSUlsUL02xzmn0ms+benJdhpc82zJ2kk5nPViR
         cnZKfmm5pvAP4m8sVADK0zJTjchJrH1betaQUbR7Bpk5FJqXmEU5z6iv6VXitt6PQDuh
         lDF5TI/Ie+shrnN2VzqkI4C2Qs22kRWMF5wh73A6lWZ7EC7rcSnnfKHxY2KMbIXAJHgR
         MIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781331317; x=1781936117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Biw74RXDhRrXl/+hvcvrUJ20txGwKAJRoRdTi99B8aw=;
        b=jy4hxiESSLT0wX1a0gL8gFdmO5b+Ow5sr2D+vtpH9Mit+IGIZPSePgE9S59TMOWVMq
         /3ld0gJ1ZNw8IPx0QilC6KHoUYLKzo3l5Dmyn1SU30XBeaadv/wIl3Sf8QBr5vaFSxIc
         cAf105Q+YY6pR6ifH/XaIac2swhkNiXTXs5Ltwiy/yC4POkcVq+oqV76Lv46REwUaujz
         NkUXKNLYxwQt0HoXEp7hmV5GskrCBmPpElCO2VunLi5m6/LcZYyql0NGVUwGgng9TvZD
         nxiJP9103CB3paBYzQLrAIBOJUM9QNgULyA8plAmoxd46h3ytETTBbcVRmbhlwSSHr7B
         Xzzw==
X-Forwarded-Encrypted: i=1; AFNElJ8fVFVtMe2nr1wYvO0emFO/dVklC2Bbie23/nUDCcePN2SQYkqigA80YQwV9V52L6J2ReFZQCFPggyWPqmm@lists.linux.dev
X-Gm-Message-State: AOJu0YzpI5YCZkf0NgMUqvSKcimJic9xuBKlYCDPXchayOk3tr+JmheG
	xk++0bu3HQbZJlB3vB9BpZdYSvTP3a3T130lEI0GZ+uM7/nY20aNaVbG
X-Gm-Gg: Acq92OHW//L/oNmcl/MMAR46x7HiqjcWiE9yKtkDFTIKlHNsjOG1ztEOgwHTzmtPGGp
	Ecwr5RiTUL47t4UqmnaHtdSrAJ8ThH3Db3MXMo7NvZdPgRrnT/+LPHLKCIyXAOMYBsHA9sZj8KU
	SVsw1KxNUu+YSQp1KQwnXShsTP7EemvKUtTOKB7whFI7E4g9nfFbCPLktcdjHSj05TcVsNjcR+w
	rnbr1yGb69xet/WMZaQa2miM0vO55VFM0ViaQonapm6ZTZx7/843Nqhmsw2DwsBP0KmdEOgFPPE
	MMDEyeODULrrtW8+QKzHwKTWFozPgitykx2TCP8dm/FunzRP3JNMeVLb+LuvoMJ1m4TmfXJbKut
	edeS0LHk7B1HgDwfgrupxkvsm4vxZuHpwj89mi+t/os39WliPywPKeS/6qQkAou/2w7QDDpaxUF
	Oxq8m4/9ww+Xt5WZAm/pYlRt+xC04=
X-Received: by 2002:a05:620a:1725:b0:916:18b1:ea5d with SMTP id af79cd13be357-9161bf58812mr898215585a.39.1781331317132;
        Fri, 12 Jun 2026 23:15:17 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006426sm417186785a.22.2026.06.12.23.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:15:16 -0700 (PDT)
Date: Sat, 13 Jun 2026 09:15:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brock Haftner <brockhaftner@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: add missing newline to
 sysfs_emit formats
Message-ID: <aiz1bMmAN-gQnm9x@stanley.mountain>
References: <20260613014905.48458-1-brockhaftner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613014905.48458-1-brockhaftner@gmail.com>

On Fri, Jun 12, 2026 at 06:49:05PM -0700, Brock Haftner wrote:
> The sysfs_emit() function is used to format strings that are returned
> to userspace. According to the sysfs documentation, these outputs
> should include a newline character for visual clarity.
> 
> Fix the checkpatch.pl warnings by adding the missing '\n' to the
> sysfs_emit() format strings inside several functions.
> 
> Signed-off-by: Brock Haftner <brockhaftner@gmail.com>

Please don't do this for existing code, only for new code.  There
is a risck that user space relies on the old behavior.

regards,
dan carpenter

