Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692577E;
	Mon, 31 Oct 2022 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667229588; bh=ZEMVja8DWlF4ba3mAw3RfOsYRZ4IhYdsf87QlCMG2ck=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=V4c6XxdK5LxVKFRmjvaH3UjMf8CChts866p6YL1PEGRCjW2eWVYToxdW5SXkeNc6U
	 W+pIOx8T4O7bK2fsD0MbXvimucrYUYiHdjpCpdrZI+X6mVe1tBQ8RWx+FHOsd8Gj6X
	 smkpNo+9ow43spaP1lJpAPXhiDAGD7PG04MeNtWw=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Mon, 31 Oct 2022 16:19:47 +0100 (CET)
X-EA-Auth: cUQJES+A6ymW4Zu3lfIZB3rUnb6kP8RucNBQGmLYRclvTn4/AHoDKGCbQ/mTh4uB4ob2i/jxONzN+TOm7pLoli+Y9NMzQH73
Date: Mon, 31 Oct 2022 20:49:47 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8192u: remove unused macro definition
Message-ID: <Y1/nk7SQApdNN5vQ@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666754500.git.drv@mailo.com>
 <b7053d8737c048d6a878609f0ec24d66b18c5abd.1666754500.git.drv@mailo.com>
 <Y1kyr/hWqbKCzaaR@kroah.com>
 <Y1k5y5PVT6t0+OIS@debian-BULLSEYE-live-builder-AMD64>
 <Y1k8NWuTxOf6z5zL@kroah.com>
 <Y1rdEE8HBb9CVwlq@ubunlion>
 <Y1/fn1+cthIdPKl2@debian-BULLSEYE-live-builder-AMD64>
 <b728f4b-3e20-87ac-c58e-8a567fadb02d@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b728f4b-3e20-87ac-c58e-8a567fadb02d@inria.fr>

On Mon, Oct 31, 2022 at 03:55:59PM +0100, Julia Lawall wrote:
>
>
> On Mon, 31 Oct 2022, Deepak R Varma wrote:
>
> > On Fri, Oct 28, 2022 at 01:03:36AM +0530, Deepak Varma wrote:
> > > On Wed, Oct 26, 2022 at 03:55:01PM +0200, Greg Kroah-Hartman wrote:
> > > > On Wed, Oct 26, 2022 at 07:14:43PM +0530, Deepak R Varma wrote:
> > > > > On Wed, Oct 26, 2022 at 03:14:23PM +0200, Greg Kroah-Hartman wrote:
> > > > > > On Wed, Oct 26, 2022 at 08:58:44AM +0530, Deepak R Varma wrote:
> > > > > > > Pre-processor macros that are defined but are never used should be
> > > > > > > cleaned up to avoid unexpected usage.
> > > > > > >
> > > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > > ---
> > > > > > >  drivers/staging/rtl8192u/ieee80211/ieee80211.h | 2 --
> > > > > > >  1 file changed, 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > > > > > > index 00c07455cbb3..0b3dda59d7c0 100644
> > > > > > > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > > > > > > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
> > > > > > > @@ -230,8 +230,6 @@ struct cb_desc {
> > > > > > >  #define ieee80211_unregister_crypto_ops ieee80211_unregister_crypto_ops_rsl
> > > > > > >  #define ieee80211_get_crypto_ops	ieee80211_get_crypto_ops_rsl
> > > > > > >
> > > > > > > -#define ieee80211_ccmp_null		ieee80211_ccmp_null_rsl
> > > > > > > -
> > > > > > >  #define free_ieee80211			free_ieee80211_rsl
> > > > > > >  #define alloc_ieee80211			alloc_ieee80211_rsl
> > > > > >
> > > > > > These #defines are a mess, please look into unwinding them as they
> > > > > > should not be needed at all.
> > > > >
> > > > > Hello Greg,
> > > > > I would like to know what you mean by "unwind them". Is there a documentation or past
> > > > > commit that I can review to understand the expectations better?
> > > >
> > > > Look at them and try to figure out why they are there, and then work to
> > > > remove them entirely.  A define like this is very odd in the kernel, it
> > > > should not be needed at all, right?
> > >
> > > Hello Greg,
> > > I will look into these additional macros soon and send any further edits as a
> > > separate patch (set). Is the current patch set with 2 patches acceptable?
> > >
> > > Also, I am trying to get Coccinelle to work on my machine. Trying to work
> > > through strange issues. I will work on the macro unwinding task you suggested
> > > once a get the Coccinelle task completed.
> >
> > Hello Greg,
> > Most of these macro defines appear to be unused in the module anywhere.
> > I can simply delete the #defines for these and let the original function
> > names be retained.
> > The other way is to rename the functions by the defined value. So, we will have
> > to make the code change to use the foo_rsl symbol names at all places. This will
> > be a bigger change involving the API name change itself.
>
> I'm not sure to understand.  In the case of

My apologies for not being clear in my message.
>
> #define abc def
>
> If abc is never used, it would seem that you could just remove the macro
> definition.

The module uses abc at all places in the code. It gets simply replaced by
abc_rsl symbol name at compile time. I am unable to determine the utility of
this compile time conversion. So, to clean it up, we can continue to use abc
in the code (by simply removing the #define line) or make code changes to use
abc_rsl (makes the #define line redundant and be deleted).

Hope this helps.
My question: should we use abc or def in the code? The only hint I have form the
code comment is this line:
	// added for kernel conflict

>
> If abc is used, one might consider whether the renaming is worth it, or
> whether the abc's should be changed to def.  Or maybe def is a very simple
> function, that just calls some standard kernel function like kfree, in
> which can you could get rid of both abc and def everywhere and just use
> kfree.
>
> It is often better to use standard functions, because it makes it easier
> for people to understand immediately what is going on.

Thank you so much for the explanation. Since the initial intention is not clear
to me, I am unable to decide the go forward name for these functions.

May I request to look at one of the macro implementations and make suggestion?

>
> julia
>
>
> >
> > I am unable to determine the initial intention as to why these #defines were
> > added. Can you please suggest what would be the recommended way for the clean up
> > of these unused macros?
> >
> > Thank you,
> > ./drv
> >
> > >
> > > Thank you,
> > > ./drv
> > >
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > > >
> > >
> > >
> > >
> >
> >
> >
> >


