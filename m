Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C3B277818;
	Tue, 24 Feb 2026 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956602; cv=none; b=jT+i+RAtI4xBgohwkR9SdvaGyKkuVXmwSR033Wietduu6oh3D+GPkHKk7O3uRCVYMkBuXFFQzq4eDmcPaSpt2vLU7OBZb/hfl4WjUFnzSReDrt00UKd/wNcvKcta56jlinCzk19mJ3CW9PTMsRALgoe3t+fFyBZ98sW5dMK3rq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956602; c=relaxed/simple;
	bh=k8SOALTCYm/zag8PQJ5Hv/XinhIVj3Q7eRZzwQ9e6Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlDS/EEPglxYmrZDwsDLrEZz85K98MoDvspB1UZcG8EnGk8xQBan4AbTydPtiQpNJ/GnKNQBf84ZDF2zsL3Wz0utpqdDc5ITOtclBWLIO9di8r/xOeR4MnO3lli9/tVLTOkIll2h0zd4/tepBzGMvtfdRHmtpV98zMWil403b84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l5Z3fi2A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l5Z3fi2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E2BC116D0;
	Tue, 24 Feb 2026 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771956601;
	bh=k8SOALTCYm/zag8PQJ5Hv/XinhIVj3Q7eRZzwQ9e6Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5Z3fi2ANK47ViChSozcQBkOIvy5/U4zYM/HRGA4aFzf6fF4p63AffHcZEXSR1dpn
	 xOIKGQBeiS4TElTU/mQVRJyt+/cyHZIow/mg4B7m92JgJInzAWwK+AeUALGl7kRyIM
	 4WOgkKFYYtOwtrUbPYzbHMM/xULBnWwWcZkybWME=
Date: Tue, 24 Feb 2026 10:09:56 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: audio: Use sysfs_emit in show
 functions
Message-ID: <2026022438-gamma-blog-1561@gregkh>
References: <20260223181158.13234-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223181158.13234-1-chakrabortyshubham66@gmail.com>

On Mon, Feb 23, 2026 at 11:41:58PM +0530, Shubham Chakraborty wrote:
> Refactor sprintf to sysfs_emit in all show functions of the greybus
> audio manager module. This follows the standard kernel practice of
> using sysfs_emit for sysfs attributes, ensuring consistent output
> formatting and newline handling.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
> 
> v3:
>  - Add patch history below the --- line as requested by Greg KH.
> 
> v2:
>  - Add missing Signed-off-by line.
>  - Wrap commit message at 72 characters.
> 
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index e87b82ca6..f22ee73eb 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
>  static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
>                                          struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -       return sprintf(buf, "%s", module->desc.name);
> +       return sysfs_emit(buf, "%s\n", module->desc.name);

You just changed the output of all of these sysfs files by adding "\n"
to the end.  Why?

I don't think that's wrong, BUT it is a user/kernel api change, so you
need to document it, and ideally, that would happen in a separate change
from this one.

So can you do the conversion to sysfs_emit() with NO change in the
output, and a second one to add the \n if you really think it is needed.

And is it needed?  If so, why?  What tool uses these files and does it
now still work?

thanks,

greg k-h
