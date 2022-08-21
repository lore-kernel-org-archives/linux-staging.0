Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192DF136A
	for <linux-staging@lists.linux.dev>; Sun, 21 Aug 2022 22:31:40 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id cr9so6757731qtb.13
        for <linux-staging@lists.linux.dev>; Sun, 21 Aug 2022 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Yfw41fmb8ssEMetDDULZUKd7Wm7Zql11UKGR4BBlYBQ=;
        b=LEkPMcVDQgI85iiHOx5gvDrs3ze5MFqKJpmdce+kZwUEvYb9imevxUG50XGCGfI1+z
         T6EnG54CgaNFq+QZZv2jYy8ymr7/EFASN53c2H0fqFQ+zC0aE+gMJT8/1fWv8E6mBcyy
         pZ0n6N4F5aDz0sO8oCEEZqxB+ELDv5xzBLEBYUbsaS0o5XHo5R5HNKSPuITJZkoGJ6di
         6o9vCjfjb85iO7vNGC2nBi8iq5id6t1njAVWvuhkt1z6MRez2Ysgm1DS/eoyr97nXYT7
         47Wypyk82aUIvK65Fj1K3cb1Fp1HwcS5ISrPt1/08sEVXsuajFZHKDqk9vqjhfk4UIcu
         jsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Yfw41fmb8ssEMetDDULZUKd7Wm7Zql11UKGR4BBlYBQ=;
        b=OT07XzTJ+gIGLNAmrnGoMk5b5pCmzz3ucx4BCHaKRtl3NHmxEJAWzKzbCfpF1I4NcS
         llBXPjwCVZ9D2cvtjXSDjxEx1qQkRpLXZyLrR17cBPTFLrlnWYw04dAxAliwI6Yd0Skx
         3flPfNUysUS4GTbaFDxMGzT36c0U98RPplSd15S6fOByXvvhdS9IIb2+zT0cvfhM7Z3d
         M2mGjgDL6fP10BVjE6uLkTxnWGgboY4dBixiRUOHtwPBL4pq1Z5eVXI5wBYWyahzWngf
         b5zr8W8gssFLrm3f1valhqylPnicDSH0bx4Od/1PtaXt68F0TkS6A7PJPY9GXlB/1jYj
         Mzsg==
X-Gm-Message-State: ACgBeo1iiYExkCBf/wmkWD6lnFDq7j/lFE+LokGf61pZAVrb51qtb6hT
	tTYiQQdDMMj/uXjv0QHXrMA84OVFoW5fAvw20is=
X-Google-Smtp-Source: AA6agR7dRt+pDpJFWqWVAHMZqTdHTZW31Yvvt3MLriJrTSvicfLxDrEHIMQXUvmeyFFXjYh7J6Fbkxxlm9NH5Hk57GU=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr13938231qtj.384.1661121099840; Sun, 21
 Aug 2022 15:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Aug 2022 01:31:03 +0300
Message-ID: <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
Subject: Re: [PATCH 01/13] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> The acpi_evaluate_dsm_typed() provides a way to check the type of the
> object evaluated by _DSM call. Use it instead of open coded variant.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Link: https://lore.kernel.org/r/20220730155905.90091-1-andriy.shevchenko@linux.intel.com
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks!
I believe the v2 of this patch (when it was sent standalone) has been
Acked by Sakari. But I might be wrong.

-- 
With Best Regards,
Andy Shevchenko
