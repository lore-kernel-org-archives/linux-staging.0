Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E722263E
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 13:38:56 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-61a62fc8b5bso86425326d6.2
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683985135; x=1686577135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP/xjhOGCEWodxWCKUQcVzDPFWWe6m70q3NDT9usq1c=;
        b=PxM3/4NnM1HGl1zpifqWIlnZMJ5AtYZPMnUwGeWmO4VyQtRRWA21HW9P7MJd4+HwR/
         4tyCnecnDx7UNDMNAz1KfBXP1rsMPdajfqedYAWG1YNSyKHrZOMht4x/S3w+2sn13WED
         I2zq3AsBWJ7K0KLRy5LiVJTIg0aO+x5aNnRnAqPgkq7hEfxn9+ZPAe7mz88sQF8m8Bk7
         wGysaL1v7raipSAq9y3eDfk45AVxwzEhyfV08gSKFBZkO11XEOdbDt+Nn8jKQGIJQgeL
         irRNpm3oVpkLywvT/xki63veHBgyS6io5YdnJz7Q8DmfzadW011GU2GzxEl5odVBmzF5
         Fz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683985135; x=1686577135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iP/xjhOGCEWodxWCKUQcVzDPFWWe6m70q3NDT9usq1c=;
        b=ge4VBBcGZk7SElKI+1pANKvQHtkhpGaS5hBqa6xjmq7eRSU8VsiuFD+ZFrIDxorbvS
         4oLG1QGzKHkpCHT9dfWLyx4YbQka3xItEyq6F6EARJqNXAMt3Xk6R9FVBDFMIat5HzyE
         eVZgfBUhI1lnlpaE1diGf8gGepiTR7UxM3vDsLlZo4H84jS6ylSl9hdO4nLgdaXgP8tu
         Is+YUBLt04/r6Cwwk9xTLPeScDu5lrS9XGb5Jilran231LjFHZpBiSk+EEEOgk5Xwom0
         MACNh4K+wsVfcJEsqiSaU1jVXhP5WZnuCFhGOMaF7CPGL9zgl4JcIvlzckWx7JqHOCnD
         DeAQ==
X-Gm-Message-State: AC+VfDyGYflSV2ncRNKKPCGwAO5IVi4mZ2ppYHk5sW7nUIh7qpRx95Jl
	QJ6ml7Wy3dhiIqPQ8JBAbPTqdKSLVoIIVBvPTUQ=
X-Google-Smtp-Source: ACHHUZ6mrdkS0p/F4N/xrBokQ6SExd+idrDSSHjSbM0JjbqSiw5BMCANG4D+KW+qGUq8ZLcpZWD219dxreihT9TfHUs=
X-Received: by 2002:a05:6214:20ec:b0:621:331b:f55d with SMTP id
 12-20020a05621420ec00b00621331bf55dmr25728307qvk.19.1683985134789; Sat, 13
 May 2023 06:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-7-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 13 May 2023 16:38:18 +0300
Message-ID: <CAHp75VdFzAzbTLQby8rRkg6yoPbA5xy11pH1Mr7c8ExrgBJFmw@mail.gmail.com>
Subject: Re: [PATCH 06/30] media: atomisp: Register only 1 /dev/video# node
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
> Now that we no longer support continuous mode and thus no longer support
> streaming from 2 /dev/video# nodes at the same time, there is no need
> to have a separate /dev/video# node (+ matching v4l2-subdev pads)
> for each run-mode.

> Keep the video_out_preview /dev/video0 device and remove

> the video_out_video_capture / video_out_video_vf / video_out_capture

video_out_vf I assume.

> video-devices (atomisp_pipe-s) and also remove the matching
> ATOMISP_SUBDEV_PAD_SOURCE_VIDEO / ATOMISP_SUBDEV_PAD_SOURCE_VF /
> ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE source-pads.

--=20
With Best Regards,
Andy Shevchenko
