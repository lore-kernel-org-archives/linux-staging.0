Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578B370
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 08:00:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id ce15so21357750ejb.4
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hzXWVYuHPO0HzGbuV38PXs8/wUnrHlukxPMovMMm7Zg=;
        b=jw9zAPJsyisWLgmvBAMUfnjpa9BZs/XmjhHOLnKG7z9NmAkwP95EAGgEf8TPDV4urx
         UEXPJZcOvQ5Au+GxEIT7mfqmhHOnMxmadcLFeuae7zPfhPHGI9LYW3XdxG/TVaDcDtEj
         Jjpjw9QH3KB9AF87+n/mVDaZtu7cwvOHRqi5RemWG2cB6oePpwGP+fgsijjCme2CctMs
         vJpljgMU/aPEG1NXlrHeq2iQUjl/GvEl66/qCkLfUxhN4G8lC++xz8VF6fp/crtL45r7
         NgN4NMei7fsy7CTfTj0rx151SY3Sk3rh8+rsY0luTIWS45KC0aMQMlFFA+TJYmOfSFJO
         tuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hzXWVYuHPO0HzGbuV38PXs8/wUnrHlukxPMovMMm7Zg=;
        b=VEg8k3MF0ivVTSyULSaL4dhGimpHE/tJyZqrap7ym3qKoLoVNxhfye77Jsu3cOkFBv
         auGDgmDvLUQlqVMibuw/xyxW/5fXVEmJLsgO43dkbRncvnEtOl7xaYydx3/ZDNXY5NrX
         gTxNXzsrj9nR5OJq9gNJouWBhpR9yfqyVV1BMpqBfP3jW5JpYjrYVHt7ZwJhTxEWy6gt
         clnHO9gtjNEWvU6HnZel9YjI1KcM87oUTJbNzKqLUtRXFVeFtrmC/XYZ3fg8Dypr+onl
         mXDal5IUrEZ9tJBovL8VqqD9Hj9Q/925BvJnwMOTm+jr2MlOaf1jgb/eFw0nbVljLCO0
         zuqg==
X-Gm-Message-State: AOAM531FNkHw/kn74r0UMa/yXU8tpJANR7ggKX/nF42qKaoE9PKyOBqn
	99LcHjBzefdxzGGIkLlqTyQ=
X-Google-Smtp-Source: ABdhPJzWwLQ5XZiqEbS8n6pmT3UcJJbIyn4q/cdq4YQvtLEMOuFLVhfEeaZ5f7KpunFtsKSGK9K/JQ==
X-Received: by 2002:a17:907:7b9e:: with SMTP id ne30mr12756492ejc.389.1622966419823;
        Sun, 06 Jun 2021 01:00:19 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id v1sm4965624ejw.117.2021.06.06.01.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 01:00:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wenli Looi <wlooi@ucalgary.ca>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix uninitialized variable
Date: Sun, 06 Jun 2021 10:00:18 +0200
Message-ID: <10029109.FgdUXNWx4t@linux.local>
In-Reply-To: <CAKe_nd2q8caqND=z9Pq7Me_BtyuCd2-Nb_xyepsjDkaPkC8Few@mail.gmail.com>
References: <20210606070021.116284-1-wlooi@ucalgary.ca> <YLx1oWQAFPYIFRkF@kroah.com> <CAKe_nd2q8caqND=z9Pq7Me_BtyuCd2-Nb_xyepsjDkaPkC8Few@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Sunday, June 6, 2021 9:51:35 AM CEST Wenli Looi wrote:
> On Sun, Jun 6, 2021 at 12:13 AM Greg Kroah-Hartman
> 
> <gregkh@linuxfoundation.org> wrote:
> > On Sun, Jun 06, 2021 at 12:00:21AM -0700, Wenli Looi wrote:
> > > Uninitialized struct with invalid pointer causes BUG and prevents access
> > > point from working. Access point works once I apply this patch.
> > > 
> > > https://forum.armbian.com/topic/14727-wifi-ap-kernel-bug-in-kernel-5444/
> > > has more details.
> > > 
> > > Signed-off-by: Wenli Looi <wlooi@ucalgary.ca>
> > > ---
> > > 
> > >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c index 2fb80b6eb..
7308e1185
> > > 100644
> > > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > @@ -2384,7 +2384,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct 
adapter *padapter,
> > > u8 *pmgmt_frame,> > 
> > >       DBG_871X(FUNC_ADPT_FMT"\n", FUNC_ADPT_ARG(padapter));
> > >       
> > >       {
> > > 
> > > -             struct station_info sinfo;
> > > +             struct station_info sinfo = {};
> > 
> > What caused this bug to show up?  Did it happen from some other commit?
> > 
> > Are you sure that all of the fields are being cleared properly here,
> > what about any "holes" in the structure?
> > 
> > thanks,
> > greg k-h
> 
> I believe this bug has been present since the driver was added to
> staging:
> https://github.com/torvalds/linux/commit/
554c0a3abf216c991c5ebddcdb2c08689ecd290b
> 
> It's probably not necessary to zero the entire struct, only
> sinfo->pertid, which causes problems with the code here:
> https://github.com/torvalds/linux/blob/
f5b6eb1e018203913dfefcf6fa988649ad11ad6e/net/wire
> less/nl80211.c#L5919
> 
> You can see the following proposed OpenWrt patch
> (700-wifi-8723bs-ap-bugfix.patch in
> https://github.com/openwrt/openwrt/pull/4053/files) which sets
> sinfo.pertid = 0; instead of zeroing the struct.
> 
> Looking at similar code in a non-staging driver, we can see that the
> code there zeros the struct using kzalloc():
> https://github.com/torvalds/linux/blob/
f5b6eb1e018203913dfefcf6fa988649ad11ad6e/drivers/
> net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c#L6064
> 
> Do you think kzalloc() would be preferable?
>
You cannot use kzalloc there: 'sinfo' is instantiated automatically on the 
stack. The example you took had a pointer to the struct. 

Fabio
> 
> Sorry, I'm not familiar with "holes" in the struct.




