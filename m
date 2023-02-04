Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7A21C27
	for <linux-staging@lists.linux.dev>; Sat,  4 Feb 2023 07:40:46 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id a5so2213554pfv.10
        for <linux-staging@lists.linux.dev>; Fri, 03 Feb 2023 23:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzBD3RjkEQVXJjAd0KjuXJvflPQdSU1uG45LcQ+axyA=;
        b=RENpDL0ormsJ7IFq6XOd33iTswafvREQmPa21GqLxJNFQC37/1N13rjNCBT7deojSy
         ZbkMTw3VYSxFIlnCvRVDCRqmvYxg68C0rMnCqqvSMY6tKd0gjbSZLrOxlV0npZSCLx4G
         Ki8QZYdm9dQAdoN3atlUHhLhnr9NXrxlPPdlLj5A76ECh2Mr4FA1cTf9wJTvyS6xrLEe
         OBL10SqFxg2t7+yDgsVwcb7YaNiCcWxJLYmVFL2bJNVYsFdXd4Ri8/Ob6i9Rp4qjPrq5
         8JDx1Q7ItLHT4lznnpPdXR9/ymGt/jRDwtfMQ0dgUmkmMsJAOPvZMMhavafPvIC2MIOD
         3zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzBD3RjkEQVXJjAd0KjuXJvflPQdSU1uG45LcQ+axyA=;
        b=BfBqcyT2iNfDG7w2/JfQFyqkKcNW2nsHYMrGIOdhrgyWaD4Gv4QFRNzbsph9GzQy80
         HYUSpZ5k0zCvPJK6+BRpvS0susWepCxds0LjEX6ALBk63eMnBbRdO3FCMB4rbbV/dijD
         pwzVI5NStyan40TEGFOCa9Z7wPMxNM5h6mP4g8eQsX4lGkNHaxc7LiCMMJFUipcES+BC
         DDtb3coa2Vn7R/us/rKolVOpaUlQYmT8MRqpq7FIElXtE63f3fYcrQJfliPDclCKTBPY
         9E0jwfgHoLaT2/lyGEkWt91yk93HFf1Rof2oLJ4kElsZJK9MBdb958kEdJ+P6UPsfCIN
         VU1w==
X-Gm-Message-State: AO0yUKX7Et/rdt9aMnNteTKtENJePTDOmWDxAgKI82Bf90As3Vgiga8V
	+aJjQF837hikjr8LYsde4uM=
X-Google-Smtp-Source: AK7set8f0i9EA2P3Rw+dA8chIk/luv7g0KrwFPb+ge3eiVKIkln864swiKltUWk2WX1RAHyR31htCA==
X-Received: by 2002:a05:6a00:1493:b0:593:92b5:d99f with SMTP id v19-20020a056a00149300b0059392b5d99fmr15602140pfu.32.1675496445847;
        Fri, 03 Feb 2023 23:40:45 -0800 (PST)
Received: from debian.me (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id h1-20020a056a00170100b00593c1c5bd0esm3047340pfc.164.2023.02.03.23.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 23:40:45 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 245E310544C; Sat,  4 Feb 2023 14:40:41 +0700 (WIB)
Date: Sat, 4 Feb 2023 14:40:41 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Regarding checkpatch camelcase issues
Message-ID: <Y94L+WNGGfvrg6Mg@debian.me>
References: <Y93eQqaYdL146Z65@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ivj1S5qjuJSsAg1Z"
Content-Disposition: inline
In-Reply-To: <Y93eQqaYdL146Z65@combine-ThinkPad-S1-Yoga>


--ivj1S5qjuJSsAg1Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 04, 2023 at 05:25:38AM +0100, Guru Mehar Rachaputi wrote:
> Thanks for your support.
>=20
> I wanted to confirm if each checkpatch encounter for camelcase issue shou=
ld
> be fixed in a new patch?
>=20
> For example: If the issue is with same variable, then multiple
> modifications can be made in one patch.
>=20
>   -> above example is OK
>=20
>=20
> For example: If the issue is with multiple variables, then multiple
> modifications can be made in one patch.
>=20
>   -> above example is NOT OK / NG
>=20
>=20
> Please confirm me if my understanding is correct?
>=20

I guess you have generated a patch series, then check it through
checkpatch.

Indeed, if checkpatch complains at a particular patch, you need to do
interactive rebase. Make sure that rebase todo list contains "edit"
lines on commit you want to fix up. After that, fix these complaints.

When you're done, regenerate the patch series and make sure that there
are no checkpatch complains on it.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ivj1S5qjuJSsAg1Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY94L8wAKCRD2uYlJVVFO
o7jzAP95k4n/aGC4fwMnL9mTEDmSh8/gjE0F7vHOUPzIevrIlQEA7sQ+Q5aaZuxp
dmk2UwL1HJVw+rJcqhwTcl41yGmDYQs=
=pqbf
-----END PGP SIGNATURE-----

--ivj1S5qjuJSsAg1Z--
