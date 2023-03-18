Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C7829AC;
	Sat, 18 Mar 2023 14:22:41 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r29so6688315wra.13;
        Sat, 18 Mar 2023 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679149359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lkmwpvH9sgPVQtlzvbDDavt+3mGPIiqy12zSddkmIqk=;
        b=EvuVqEeNdmsExAcKsIECfZDPx7X1EeANvP/Nn6StcDA4dLDkMgIps62snjPCwQyeXa
         aDGRMhs5h2P91E4EIrwUijYIA5PYCKnyKie2SriqcEdJs4qQO246M93QVbgTCs35kfiB
         ykaYUbHmt43QKKtFKfTwL+QXlVEOwbR6QqMPR5CktbLbY2M3KeBl87mh9HVUVK9EJWN2
         z9KC6gmWavTds4RFDWZkFSbO5aazyG9Wc/OPljT0LnnzdwfPbZ8t53O/fza0MjCC0L57
         8SHImX4KteuyRpkz3qjA5mtXyPkeAV5YoZBmWNJlXKHZ/lKuFW5CyCGaCnupWpAdQl/v
         eFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679149359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkmwpvH9sgPVQtlzvbDDavt+3mGPIiqy12zSddkmIqk=;
        b=inWw4YE13A1QZka9rb9F8mUJrFh3tWDJGMbkozCGGG8OG+INNEoPe2BJW3zFwA/6kh
         FNhzCdOVtwvSIZ2VcQS9q6V+neNPzlo88I8CxAX9oFtBSrmllEbVPs8+GpfH1UpRyZEf
         o1jPZS+tRZ8ybC4wA/uuH3qwJTybxxEkcg18MX2nPsBIuIdpxKplsTlb+wy47Rsj7uVO
         LgcIB9acEoUjoLs5znZGoz0eXXq+/RVRYzviG8gwjXVRFJYIOzBBIA0a09Mw3bLlqKiv
         vtCL0gOdgYHsYpfJAJ9Ua8zNFXTo5pTX98gHzLXd/zaKLDcQqZGjVledE4sgp3wFRYco
         DLCA==
X-Gm-Message-State: AO0yUKV0KSa40aCtRwaBf4RUHw9NjCJEDHh1WJjJEvkNBCt5SgGdSrm9
	LeXXSiIgm5TLZXemjDGd7Ng=
X-Google-Smtp-Source: AK7set96I+f1RiZ6VzzeJJiw6TgJMv6fYtwvIdEEzyOihGdPog32kXCkLDJTfSButzQ2zohLA+h/YQ==
X-Received: by 2002:a5d:6944:0:b0:2c5:4c9d:2dab with SMTP id r4-20020a5d6944000000b002c54c9d2dabmr5525774wrw.10.1679149359470;
        Sat, 18 Mar 2023 07:22:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm4439375wrx.116.2023.03.18.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 07:22:39 -0700 (PDT)
Date: Sat, 18 Mar 2023 17:22:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kloudifold <cloudifold.3125@gmail.com>
Cc: outreachy@lists.linux.dev, teddy.wang@siliconmotion.com,
	sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	alison.schofield@intel.com
Subject: Re: [PATCH v3] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <dd1e1fcc-2a4e-438f-ad61-ef7640b8e423@kili.mountain>
References: <ZBW+NX4SLaCyEnJd@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBW+NX4SLaCyEnJd@CloudiRingWorld>

On Sat, Mar 18, 2023 at 09:35:49PM +0800, Kloudifold wrote:
> sm750 driver has sm750_hw_cursor_* functions, which are named in
> camelcase. Rename them to snake case to follow the function naming
> convention.
> 
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> 
Delete this blank line before the ---.

> ---
> Changes in v3:
> - Add this changelog (Philipp)
> - Move lkp tags and link to the correct location in commit log (Alison)
> - Update the commit msg (Philip)
> - Update the commit log (Bagas, Julia)
> 
> Changes in v2:
> - Use new function names in call sites (LKP)
> 
> This v2 patch was prompted by an error reported by the Linux test
> robot, which detected the compile error.
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> ---
> ---

Delete these two --- lines.

>  drivers/staging/sm750fb/sm750.c        | 22 +++++++++++-----------
>  drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
>  drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
>  3 files changed, 24 insertions(+), 24 deletions(-)

I would have ignored the issues above but when I went to apply the patch
git complained about whitespace problems.  So then I ran checkpatch on
the patch and it complains a lot.

ERROR: code indent should use tabs where possible
#61: FILE: drivers/staging/sm750fb/sm750.c:130:
+^I^I^I^I       ^Ifbcursor->image.dx - info->var.xoffset,$

WARNING: please, no space before tabs
#61: FILE: drivers/staging/sm750fb/sm750.c:130:
+^I^I^I^I       ^Ifbcursor->image.dx - info->var.xoffset,$

CHECK: Alignment should match open parenthesis
#61: FILE: drivers/staging/sm750fb/sm750.c:130:
+               sm750_hw_cursor_set_pos(cursor,
+                                       fbcursor->image.dx - info->var.xoffset,

ERROR: code indent should use tabs where possible
#62: FILE: drivers/staging/sm750fb/sm750.c:131:
+^I^I^I^I       ^Ifbcursor->image.dy - info->var.yoffset);$

WARNING: please, no space before tabs
#62: FILE: drivers/staging/sm750fb/sm750.c:131:
+^I^I^I^I       ^Ifbcursor->image.dy - info->var.yoffset);$

total: 2 errors, 2 warnings, 1 checks, 99 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

NOTE: Whitespace errors detected.
      You may wish to use scripts/cleanpatch or scripts/cleanfile

"[PATCH v3] staging: sm750: Rename sm750_hw_cursor_* functions to" has style problems, please review.

regards,
dan carpenter
