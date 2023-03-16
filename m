Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFF437C;
	Thu, 16 Mar 2023 02:48:26 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id i5so307605pla.2;
        Wed, 15 Mar 2023 19:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678934906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTKufV9UN/6aHOHpRQh2aerDUcw2Pd17xq7GQusDlwg=;
        b=WleEFJRlmZwN8NDHM4mj7yb1/Ij3Pwi33cyDB1b2+YWgPiv+r9oZfo6qkg8KgND060
         j4UlhrASW7PrmGfDhCl747ym23Fa2oHCo72hAz1EMtP94TtPJyCrS4xJ/RGerk3SYDTG
         AhILJ1UsCruQOxz8Y0gQ/okuLf2jZVYdQrbOIbyiTwnO9sQbg/QQ8D6j9qpyeXML/GpC
         FhTwI6WI2VqXVM/dEXR4EMeOuFhE9p60zclGawN/+BmU29HAalk+1XsE21lNOkyQN82V
         aMzvZs4xFhVoG45S5iNeDDSujUQGq3/Bg7t/ZVj5tLKiynEpwSG5fuzIp664zxVuGbBe
         RNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678934906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTKufV9UN/6aHOHpRQh2aerDUcw2Pd17xq7GQusDlwg=;
        b=twQ0Az6+97L+TCFwViM8bggZswXv7e3V5JHJ9j11lVduILXFXVGd2TgNgay8mWNvvm
         W8e4ucSs7ECOcqgkY2hIcpLM1ab/b9ww7um+Wx161PpkgFlBpmBObliWbO4BQqae5rMI
         PJnseXdpdq7YR6iN7MsgJnvQdJUFH6eHZ1t9aPGkFXycrRHkgUE410MdUgtuErHcJE5e
         Kl2ibR+pwtSqlc8SskcKu4yGZyic13rT3OIffOVQPgv2Ad1QYnFAyfTNwscNqDDYUovt
         KUuV3fewRaThyHgFPT7sSy4W4nmswa2F4fHGMCY/abyZQOmXXK8AhhUOekwxAxcVp9xX
         QtAw==
X-Gm-Message-State: AO0yUKVy/U/+kRIkG3/KlMRZ6+KZ01epJHofZPPrAseQu+ST+wpU5Pcu
	QACKj6ddKvteObFRgwn84HQ=
X-Google-Smtp-Source: AK7set/9k02ydkxJEv0mQ0EZNKzmeLns5+SDZPxIlZp8Yi6wL7O6KZvrkz6mPVOclFCGo7jAJhYfrA==
X-Received: by 2002:a17:902:cec4:b0:19c:d97f:5d16 with SMTP id d4-20020a170902cec400b0019cd97f5d16mr2081524plg.3.1678934905930;
        Wed, 15 Mar 2023 19:48:25 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-41.three.co.id. [116.206.12.41])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709028bc500b001a19196af48sm173475plo.64.2023.03.15.19.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 19:48:25 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0697E106570; Thu, 16 Mar 2023 09:48:21 +0700 (WIB)
Date: Thu, 16 Mar 2023 09:48:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kloudifold <cloudifold.3125@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Message-ID: <ZBKDddHeKlWohA0T@debian.me>
References: <ZBHlycBoZ0JRwHZm@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SBJ6ZCI05vY7XdIK"
Content-Disposition: inline
In-Reply-To: <ZBHlycBoZ0JRwHZm@CloudiRingWorld>


--SBJ6ZCI05vY7XdIK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 11:35:37PM +0800, Kloudifold wrote:
> Subject: [PATCH v2] staging: sm750: Rename functions from CamelCase to sn=
ake case

If I only see the subject above, which functions are renamed? I have
to see the actual diff if the patch description doesn't answer that.
In this case, I think the proper subject would be `[PATCH v3] staging:
sm750: Rename sm750_hw_cursor_* functions to snake_case`.

> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@i=
ntel.com/

kernel test robot (lkp) reported errors on your submitted patch, not
on commits already in the tree, so both Reported-by: and Link: trailers
above are not appropriate.

If you want to add trailers from someone else (like kernel test robot
above), you just need to write e.g. (ignore markdown):

```
Link: <link>
Reported-by: <identity>
Tested-by: <identity>
```

In other words, trim the preceding ``| ``.

See you in v3!

--=20
An old man doll... just what I always wanted! - Clara

--SBJ6ZCI05vY7XdIK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZBKDcQAKCRD2uYlJVVFO
ozthAQCwSUBKCNNTZrAqYE+Oq+ztciMHrkpgxQtV6sr9YJ6BZAEA/PO2kSXaxC/f
Vvy6BMrawJz3yTvguvVWokgh5RWxHQQ=
=j4A0
-----END PGP SIGNATURE-----

--SBJ6ZCI05vY7XdIK--
