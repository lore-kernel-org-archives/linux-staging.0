Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A803128B2;
	Fri, 30 Jan 2026 05:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769750806; cv=none; b=HT3JQp6lYQKFYduJ4FDWLLxt0EB8ijTZeNMxCrSD+h7HWS7kbnL/14XnyTtG1CQVSb1q/gxz/AjSDEn+UtGlcHCAziVGE/qTluyuxWXGi+CnFmX1el1o5SqIsYxMWyGtb31S+UytTsXB5hNWpsO+n9LGDFk1s1v5PWxrrOzRdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769750806; c=relaxed/simple;
	bh=njaYbVrvlsbPMbP1JWAmxew5Hl7TQOufaZq9cml+ppw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWgPPIthgSGezIggLhj8oZeIH+sI3V+DMOwIyPPZpywkk6qvz2dj9i32xLbBsxnYoCAYUk3kmY2SNnodAhuWDe9l2k8pycvb8OqZoZQ7d5CCkXBbEQ/+EGqZlwh1a/NTaJ7Uj/Wa2eYALe1TfYb/J90NxCkfHErgFtMNSF7/N1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GwzgJNFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GwzgJNFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E038C4CEF7;
	Fri, 30 Jan 2026 05:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769750806;
	bh=njaYbVrvlsbPMbP1JWAmxew5Hl7TQOufaZq9cml+ppw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GwzgJNFojj79f6xrTeAlNqd3f8S9/XhJLrXvUWxnXPXHqf6DTljS0DrwiSV9y/R7I
	 zLBYt+JZ7L2R3BCnca1lTJhqmy4zM30S03rcku5oPNXsLsl+MPHu2edd0RA+m9IJZw
	 0XwxAk5SzRqUALl7Ll4eK0bVZa32lNKBfZAZq60k=
Date: Fri, 30 Jan 2026 06:26:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: straube.linux@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] staging: rtl8723bs: fix out-of-bounds check in
 rtw_restruct_wmm_ie
Message-ID: <2026013030-suspect-chatter-02f3@gregkh>
References: <20260129132352.14615-1-lukagejak5@gmail.com>
 <20260129132352.14615-5-lukagejak5@gmail.com>
 <2026012925-emblaze-barrel-46fc@gregkh>
 <CADRnA91+NQ=DLRSj+9SoTMBAEKDmzFiX98XR1+YCM2tgBiyDTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADRnA91+NQ=DLRSj+9SoTMBAEKDmzFiX98XR1+YCM2tgBiyDTQ@mail.gmail.com>

On Thu, Jan 29, 2026 at 04:35:29PM +0100, Luka Gejak wrote:
> Subject: Re: [PATCH v2 4/5] staging: rtl8723bs: fix out-of-bounds check in
> rtw_restruct_wmm_ie
> ​On Thu, Jan 29, 2026 at 02:23:51PM +0100, Greg Kroah-Hartman wrote:

<snip>

something went wrong with your reply, sorry, it was in html format and
all mushed together and not in the in-line response format, which is
rejected by the public mailing list.  I'll be glad to respond if you
resend it in text-only and interleaved.

thanks,

greg k-h
