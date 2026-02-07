Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8162475D0
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770473205; cv=pass; b=r9bMb5JhVAVPxytL1K6DwBrcQgISlJfNuYjn9WTdl4cJ11QQ+EbY2M4PZ/8aqQLjxw3OKDjcXGtiX1bNQ3AAKXWjvPxbKVI3YgRjtIlI5GFAvgrsWipv7ojt3TVDPXTBe35Jyx2lwjyYhM3D9vAtX+wqtSDbvL0P1R9yBQosYXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770473205; c=relaxed/simple;
	bh=W143jzaLn0JBe3DCXkBcp4wITNNokpyr6McNqc6Il+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4og9wpThTt4rBOWqCe/ftQEwoqf/+HvH94TpyL46gcoj/En4YUIOY2OryNCexRxKx5YXsag3hQyLy8WhqzskpQ6r2FdlIWWBi9+yBfKKMi6WTKlwfymuR1JCwu6TPPrIJKO4mUVSLE568fw4mlLgJ9uVy6YT7vGKKnzKDG3fGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxjLCRYg; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxjLCRYg"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso504367eec.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 06:06:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770473204; cv=none;
        d=google.com; s=arc-20240605;
        b=RdrcWafRKS8z61rv8AayeoOkfgyYS1PTaoYH5qbQ2AXfbI8hFX8lbV1W8EWt0IeV/n
         vO8kczZr+oiiEgeSi5lge/Pk9BdZha4pqHXnTE5lfqlOyJ0UPvJFPtybBw3Ldw+iggER
         EHZzoe0dWyRkB3KuU+o1wm5FBfrkE1y0Lj6hnQpJNFSBugREvSgfGD46jfQxeeWgeaaW
         VqDinOlDmWusHQsdvlJJRR/0kIQ/JER0hiXAdvdXDiamyWiHLr+o5VJRTyEcH8Mtyy4+
         jTLPQh/8eqPdZYObu8db7QUEMSaen2LiyeizwSkmlsxRUS3f7n3L1EgH4lg7HXO/XH07
         GryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kd3A6cnl3lOjnpe7kXJ7mZavCBOLJPJcOpMe2TOxXXQ=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=VAOuFXxVIDX6SXdlrjQSDoTNIdzHEIP3/GVoKbpmb/cERHZhmuJLI+DxEEn2mo8Zmc
         bYczhrz/m99neSKb0TwtEFD89LjZls2YL2Scj4dF0BgXTW2g/N55RyfHNUZaFL6lZX1m
         uLecNFxvaqymhXmLcDTtSZfHIyWZcrMkeYnOwAz4nnuYwVqXxr3x6cqwWZ2IHsgd4bjf
         Dreh30+GF5EpFn9umLtxtPv8DA4A0zP8jL7UYBBvm67itwwZAgvt359KO/0D80x3LXTo
         BkGhIGRz0xccpjOYtO2S31uxh9cmgzgA6FTvwfDEn45pTLQYODdRubMualTOHiYgcFj2
         nDSA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770473204; x=1771078004; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kd3A6cnl3lOjnpe7kXJ7mZavCBOLJPJcOpMe2TOxXXQ=;
        b=QxjLCRYg0v6ags2+h8dSeW6AR0TF2vrQomja7YsGFfsxkgiIkPbOzldoteQsCBL/h9
         LzQylC/KS7xt4t4L3GrlQzIkdW0d7zZw+BinWVOiJDsjpY3C/v8zGYXjC0RnyHPucTu5
         B0Qlo4f3fi1HFuWoPegEbmvaHM6YgD7hC/UF6z9pAqbGIje62Ku7yE1z1Fqvos1OkJuG
         d0NkMyoLCtvprxn5QgSMywDdWiqKnmiEegvoWdJi6o3dq72rNDM5QY/NWF4TC7zSxTGZ
         XOT1zvr+oDW6El87M/6OWi72QHMwXAmfVmJjbzzXY6PfBESet7qHFbfdTdGoBgqM6oZP
         E8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770473204; x=1771078004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd3A6cnl3lOjnpe7kXJ7mZavCBOLJPJcOpMe2TOxXXQ=;
        b=AnRQeLRozbKNLUdHMcWp3xchjjo41tRbRRPveAJK1xrQW0xDFBRRHYX5OSSKKjFSvW
         mnhQkrXJ1ZXnLAhvhQWj+hZpS8s0S9544y9msSNCafZlGWqgnZ2ZuQ0ayHBIMSua/KKq
         XDLNyYfEDBI+G8/qsYR5DlL+M4vsvVn8VBHNRJ2P+XGi5EsLPaW6W1UOcIRjXp5oG71N
         MKHwV7D556McrozuEJ3pjXvzbfB3xAwjuRnmVRFtALZQMjGQOg+qo+zCzZPIuTs+jl58
         CW2SWBPOC+33gzY9ADBslGbH8+OKlBRtOLrabjYsHF53DQGLwbgFgvRYhdR6Ven53LjH
         8OJg==
X-Gm-Message-State: AOJu0YwAYKPoThxFbKM5yvWagiX1ZDTh3AeSSBeGbSCTG55r4nZCHwtn
	aR2ezEg25iyJakHzl3fmeJ9JiKaOzOFH8eNzEx593+lke12mzlvtKGd7NvfsBijoUxVge0r/Gld
	T5IiqFId7orKmliFlLCzzYbXC9v1wPNQ=
X-Gm-Gg: AZuq6aIZBXSp9eSVGCKOreYPFQ1M2TZW4DWuXu1q7h3jp2zWC4KsVP2Hve+5DZmXbiW
	tWd0qwr9jjhtr4WPBumayv2MqRX+iTvZUCZpW/FaznGDkFaCwn11EEIsOQMR20FOqr5EKpuMOrN
	dfcJrm1d+nhihV7yyHzrAQ1Faq2Gf/l6xRUsOjpaQACCFki86ofC7lg8ejU4iMCWVxJwUvBSDgf
	xihhOIItgYtIXYJiSBlfhHLzj+RoJ4kKqA8noVXdoNgHJdjrSqoVYTlPVqRdQrgxy/dY3Q=
X-Received: by 2002:a05:7301:1e82:b0:2b7:2263:3d4f with SMTP id
 5a478bee46e88-2b856840978mr2821888eec.34.1770473204109; Sat, 07 Feb 2026
 06:06:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205120909.161336-1-tmimiharoen@gmail.com> <2026020752-extortion-coleslaw-9687@gregkh>
In-Reply-To: <2026020752-extortion-coleslaw-9687@gregkh>
From: Haroen Tmimi <tmimiharoen@gmail.com>
Date: Sat, 7 Feb 2026 15:06:33 +0100
X-Gm-Features: AZwV_QjEDOzjytINYQYni2oiohyqg9kVIT2R6dIa5zTa31za6dCIDCQxJlde5bQ
Message-ID: <CAH+Y0=0tT7gx2htB2CYtOV+6AarFu_q1vYGZ=r8MH8w8_Z+bkg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: constify _action_public_str in rtw_ieee80211.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for the update. To answer your question. No, this isn't an
assignment. I am an Electrical Engineering student learning kernel
development in my spare time. I picked this driver simply because it
looked active in the staging mailing list and it was recommended on a
YouTube video I had seen, which I guess explains why others are
contributing as well.

I'll check the archives more carefully next time to avoid duplicates.

Best regards,
Haroen Tmimi


Op za 7 feb 2026 om 14:40 schreef Greg KH <gregkh@linuxfoundation.org>:
>
> On Thu, Feb 05, 2026 at 01:09:09PM +0100, Haroen Tmimi wrote:
> > Make the _action_public_str array "static const char * const".
> >
> > This ensures the array entries are read-only, preventing accidental
> > modification of the pointers.
> >
> > Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> > index 92b12a13d27c..febc14de6bc0 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> > @@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
> >       return true;
> >  }
> >
> > -static const char *_action_public_str[] = {
> > +static const char * const _action_public_str[] = {
> >       "ACT_PUB_BSSCOEXIST",
> >       "ACT_PUB_DSE_ENABLE",
> >       "ACT_PUB_DSE_DEENABLE",
> > --
> > 2.53.0
> >
> >
>
> Someone already sent this same change before you did, sorry.
>
> Why all of the same fixes for the same driver are happening at once?
> Did a class just happen that encouraged people to make these types of
> changes to the driver?
>
> thanks,
>
> greg k-h
