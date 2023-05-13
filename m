Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9AEC0
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 15:19:33 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-61b58b6e864so97092646d6.3
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683991172; x=1686583172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwWJrWJlFP2v/ffYdhBRjWOf/KnP9/7E2ysk8Wnfe30=;
        b=S56KS0S4ygmQQKL0PKJVTT8FMkWbI/TzCM50gpRVcMByP1x8UBqcrbO8qK9FcC3Pd2
         ve7+PTpDsRJMyw53NUP+ZFsj/zqHuiPYF/ooqdJYcjzHVg0UfN1ARO1IjXCME8frEnbj
         dVn6NP/jmSomzMTRxYrv6yvM0HOZKcTQkwNt36tm67PImvxfO1RYwSD38Z3NbCBCVhK6
         2k6LT8+DGNeCbyBEVRzND8mrrR7xQm8AZH7tewE3D3xoBt9sbI0ewwSv6oL11OpQgCI7
         wNBPmSQUNuv7EFcWiRLd4GhE9m6FBcHTr9nioYsqVs9MdP9+C1fXH9UZ20uL17Fyh5M6
         T6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683991172; x=1686583172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwWJrWJlFP2v/ffYdhBRjWOf/KnP9/7E2ysk8Wnfe30=;
        b=hEWd5lNeNFNt0nGoEX9cBJomq4DXJU86boL6+2POoTlHUeEXF8C/19uPd8I7YbOK69
         Q1oQznaHdo4tG7kc4xDFawrUIQ8YtzthfA/WvbDsEMDNZG8c0a/s+oE92GP1yTNYIEMs
         bMsN/yKq5Eb9fMUxlyN8MH0mSA0ILJRHumukBHLiUSzkyBrsC03IrhFr3rDLcC3Zxu4H
         gsZSXwZ1HAwxZSJpq0VBSoxPzTOn4DwGDJcArWl6d0coFRoLWqM+TcyGEulP4IfsV03Y
         kb8kv9f0WoinBNLTtiB31Vbcm61kCU+4umR87/gPeNFQ1m6sXMwCngosP5I9WFBqGw25
         PXuw==
X-Gm-Message-State: AC+VfDzwd5aDW6zrlnfE7vY9qEYT/Wu61sHZmRGROexHLzJGCIMHAc49
	CsEkuJFpf0FYY7dlfE4AaBYoOMlrgmFLeOT6wqo=
X-Google-Smtp-Source: ACHHUZ4b3u/IGeYpu+rqevhthPqD5sSNvaipJgWY9FOYEemwkEApW00aih4uL5xpuYl0lJ08xe6iHe9CuE/pwy/akbI=
X-Received: by 2002:a05:6214:404:b0:5ef:46a9:15d2 with SMTP id
 z4-20020a056214040400b005ef46a915d2mr51435511qvx.7.1683991172617; Sat, 13 May
 2023 08:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-12-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-12-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 13 May 2023 18:18:56 +0300
Message-ID: <CAHp75Vdap=KkfTjW_CPAB4W8W-kS8cKMk7Q9jFfY7vMPi8n0JA@mail.gmail.com>
Subject: Re: [PATCH 11/30] media: atomisp: Remove atomisp_subdev_register_video_nodes()
 helper
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Now that there is only 1 /dev/video# node left there is no need to
> do this in a helper. Just make atomisp_register_device_nodes()
> call ideo_register_device() directly.

video_register_device()

--=20
With Best Regards,
Andy Shevchenko
