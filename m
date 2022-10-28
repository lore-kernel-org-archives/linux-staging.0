Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52192563;
	Fri, 28 Oct 2022 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666964465; bh=dn3QC759JYSbdACAbjB+1SsJHL5LPhszMOHvnTxlp2w=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=BuiTchFxwmMu50w2A1Gk7O5uorgN0Egt4VIWDmHCUxOezqWSX1TL6MV2fySdDIRR/
	 cfS8TdPTYmdcPJzIw4vXy1jimJZu16I3YEbDOXGgH/4CKG8q8Pqm1eootTMe2XdZI3
	 yuG2kQgtmBQhGEQfLzsg6o0ydaHzy1Io+eD4j0D0=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Fri, 28 Oct 2022 15:41:05 +0200 (CEST)
X-EA-Auth: zjD3JWTuqW65h7OUlWQt+bac8mNfQPBdWtxbP4lNIW7AbDNyWoG0bkvLonVx/zdZDq6GcPCSy3C56muCCKIQ3DX2aRhZjmRq
Date: Fri, 28 Oct 2022 19:11:00 +0530
From: Deepak R Varma <drv@mailo.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Use flexible-array for one /
 zero-length arrays
Message-ID: <Y1vb7OoJqVK3C5bc@ubunlion>
References: <Y1vNNSSWK1EkcohT@ubunlion>
 <Y1vaR0olLH9+bJbk@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1vaR0olLH9+bJbk@kadam>

On Fri, Oct 28, 2022 at 04:33:59PM +0300, Dan Carpenter wrote:
> On Fri, Oct 28, 2022 at 06:08:13PM +0530, Deepak R Varma wrote:
> > Flexible-array member should be used instead of one or zero member to
> > meet the need for having a dynamically sized trailing elements in a
> > structure. Refer to links [1] and [2] for detailed guidance on this
> > suggestion.
> >
> > [1] https://en.wikipedia.org/wiki/Flexible_array_member
> > [2] https://www.kernel.org/doc/html/v5.16/process/deprecated.html#zero-length-and-one-element-arrays
> >
> > Issue identified using coccicheck.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/wlan-ng/p80211mgmt.h  | 8 ++++----
> >  drivers/staging/wlan-ng/p80211types.h | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/wlan-ng/p80211mgmt.h b/drivers/staging/wlan-ng/p80211mgmt.h
> > index 1ef30d3f3159..d6fe52de2c8f 100644
> > --- a/drivers/staging/wlan-ng/p80211mgmt.h
> > +++ b/drivers/staging/wlan-ng/p80211mgmt.h
> > @@ -229,14 +229,14 @@ struct wlan_ie {
> >  struct wlan_ie_ssid {
> >  	u8 eid;
> >  	u8 len;
> > -	u8 ssid[1];		/* may be zero, ptrs may overlap */
> > +	u8 ssid[];		/* may be zero, ptrs may overlap */
>
> How have you ensured that changing this from a 1 byte array to a zero
> byte array does not break anything?  It's not uncommon for a people
> to do math like "size - 1 + length".  The "- 1" would be to take the
> 1 element into consideration.

Hi Dan,
I did a code review to understand how this structure member is used and did not
find any computations you mentioned. I would certainly like to receive your feedback
as well.

>
> I was trying to read through this code to check your work, but then
> you sent a second patch which also does not explain how you are auditing
> your changes.  Can you go a bit slower?

My apologies for rushing patches in. I will hold on for feedback on these
patches before turning in any new patch involving similar change. I hope it is
okay to send a different type of patch though. Please correct if I am wrong.

Thank you for looking into the patches. Appreciate your time and feedback.

./drv


>
> regards,
> dan carpenter
>


