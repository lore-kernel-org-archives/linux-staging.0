Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FEE1DDC2B;
	Thu, 19 Mar 2026 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773902286; cv=none; b=eAlGPjS7aKHHuIYi82zgd9IOvLyyiR1NMBu5ClCikxU/0OBaZA2j5WMnkb8DtlI6qCJ4tN0Ewz46BOLk06abL39NDJnkT7EryYVqWowmpGGg+m3go7ROGbaQPR2H07YGgiIfZlLvBlTKBb5QHR8MrQIjFkrEGgDOxkpO0cyhpIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773902286; c=relaxed/simple;
	bh=UdpGW6uhy+M9H4WsL/ZbyEi1ehMjnHuqXgBpE4HLyIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOG5zlWCzoQGNr6oan2u4dV6j7u5ai7EE3UCc5Xtk7wEXTy9rcsmYXl3BwqrX3xAzF87P7CK4BHf1cgi0P1xEn7jMFrP+w+jpMf+DgftJfBpIYPxX5/KZgeVOxQ7koquWQK3M/QPXLK/JSfxQVNzhTXGU/vaB7vm2HPm1PgUlGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q4WnjnQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q4WnjnQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CFBC19424;
	Thu, 19 Mar 2026 06:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773902286;
	bh=UdpGW6uhy+M9H4WsL/ZbyEi1ehMjnHuqXgBpE4HLyIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4WnjnQ9bmzR+I4FkuaY5tOyQMEx1lb/E8s/vnKl9PYOkzO+5ZTV7QJ0MR99AQNOC
	 eT6xIHwMUJOgu9Ql76q0eaRIxxD0PaJzsECsa+a2Q8QvxXWaD+uuD6MqVZIaAmzB+9
	 aQqmaXzrXQ09o1T2HOtNrhJpjAzzWhK+3TcT+yjo=
Date: Thu, 19 Mar 2026 07:38:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Aadarsh 7001 <aadarshmandal9354@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fixed the trailing
 whitespaces/commented code
Message-ID: <2026031949-jeeringly-gravity-458c@gregkh>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
 <2026031841-turban-sludge-c8c8@gregkh>
 <CANQQrNO0GzqhYLj7DauWAoO=tVCz=86YaSjWWjAf-ER+UKmK6Q@mail.gmail.com>
 <2026031814-unskilled-scrambler-3372@gregkh>
 <DH63N4L7EAPC.2TAFLF2BQK8K5@gmail.com>
 <2026031800-tank-shakiness-3d58@gregkh>
 <D3463B51-C2C5-4A9E-A7CA-5A3627AB04F8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D3463B51-C2C5-4A9E-A7CA-5A3627AB04F8@linux.dev>

On Wed, Mar 18, 2026 at 10:06:57PM +0100, Luka Gejak wrote:
> On March 18, 2026 7:17:44 PM GMT+01:00, Greg KH <gregkh@linuxfoundation.org> wrote:
> >On Wed, Mar 18, 2026 at 12:54:38PM -0500, Ethan Tidmore wrote:
> >> On Wed Mar 18, 2026 at 10:11 AM CDT, Greg KH wrote:
> >> > On Wed, Mar 18, 2026 at 08:36:21PM +0530, Aadarsh 7001 wrote:
> >> >> On Wed, Mar 18, 2026 at 5:09 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >> >> 
> >> >> > On Wed, Mar 18, 2026 at 07:59:28AM +0100, Luka Gejak wrote:
> >> >> > > Hi Aadarsh,
> >> >> > >
> >> >> > > Thanks for submitting this patch, and good luck with your GSoC
> >> >> > application!
> >> >> >
> >> >> > Wait, what?  Is GSoC doing staging patches for "entrance" into the
> >> >> > program?  If so, SOMEONE needs to tell me this, otherwise I will have to
> >> >> > treat all of these as an abuse of the community review process and just
> >> >> > flat out reject all staging patches until the GSoC application process
> >> >> > is over.
> >> >> >
> >> >> This isn't ok, you all know better than to do this.
> >> >> >
> >> >> > Who is in charge of the kernel GSoC project this year?
> >> >> >
> >> >> > greg k-h
> >> >> 
> >> >> Sorry for the confusion, that wasn't my intention to abuse the community
> >> >> > review process. This is my effort to learn and contribute to the kernel.
> >> >> > I'll be extra care ful on this. Thank you for clarification.
> >> >
> >> > If you are applying for GSoC, this is not your fault.  I want to know
> >> > who the mentors that asked you to send this patch, where is that
> >> > documented?
> >> >
> >> > thanks,
> >> >
> >> > greg k-h
> >> 
> >> It's on the actual page for it [1]:
> >> 
> >> Create a small patch that fixes a trivial issue in drivers/staging. 
> >> See points 1) and 2) below to learn the process. Only after this patch 
> >> is accepted by the community you can go and work on the next step.
> >> 
> >> Thanks,
> >> 
> >> ET
> >> 
> >> [1] https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> >
> >And it points to a video of mine from 16 years ago
> >
> >{sigh}
> >
> >It would have been nice for someone from that project to give me the
> >heads-up that we would be getting a huge increase in our review load :(
> 
> Hey Greg, 
> Due to an unfortunate situation of current GSoC and an increase in 
> review load, I am able to assist with patch reviews if you want.

I never turn down patch reviews, as long as they are correct :)
