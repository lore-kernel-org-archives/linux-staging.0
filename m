Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CA87F8
	for <linux-staging@lists.linux.dev>; Sat, 18 Mar 2023 07:51:05 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id p4so6209458wre.11
        for <linux-staging@lists.linux.dev>; Sat, 18 Mar 2023 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679125863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+As7vie8N8s59ETHaGf9UJ+zSFOwNWpAniW6fJEOFE=;
        b=W78NR3YbYmaVDR/ba9WPGziRu7ooqerV6RjKmGLHgeMb7mUf7Q3fckA7ys9v6OKgVu
         AANJ5Jdyt8DvgRiYuCqPq41xIDdSh0eMU07fWZJikyjZ4SVOTMm0ZPXDjkFteb49/cU/
         /v1IoV0JINwwuUQs6UVOdXcBOxm19a0Bb99IpXkyMzUK6pr6zH6MRoBpPy0x1Uy/NYvM
         qvPEb0g6AaYkdiuaXA6Fpg8oSbD71+UftIl3fsIW/qPFYBORJz80tsgUfg5uug+R8VLo
         tBH9g5CqS0PZzTECFNo0JNh6Y8bX+ozztNkVwFHivkO5osVug+gMMjy9iZwEZV+JbosA
         dizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679125863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+As7vie8N8s59ETHaGf9UJ+zSFOwNWpAniW6fJEOFE=;
        b=d/kjgCvYCEKvzdPAUFcc0vkVG6SMhSsQZwlpB7cLU4D9uarLaaw4vpGVaYJ8bArFgJ
         B+aeRpuo7WC8ibXxdqlyWvg2zbo6aovT4+UL1zA3KvTPk1NDeafpRNz8Oh/PqsSJGZfI
         nRz/AbylhGqSxQ0j2CfvX7fuHN+eL4KYs7CRQWP1Hk8aZSoB4o9pzgMBlFs/m+OMXmuU
         MoT4PSo+s0bwIf2/JYtfS9nGM160EMCXH4mbO5ke4edrsVgaZw4OLX4AbHjLu6xSC/2W
         10L6rYhrIR3rdg1wjjfzpnepkU6KCrmZI45t57dGQlYiY8QRqYrvbCj8P4tpgciFu5CE
         lF6A==
X-Gm-Message-State: AO0yUKWatMRNIxN7Fhh7FCuzLnBBnbrkhdzHKmDmipUHimRzX/brdCM8
	VJG3tdJMEgu0F/21bWfWnq0=
X-Google-Smtp-Source: AK7set/GZHlIs69TB9+8FNiWVqS072+J2sCpOhA8cihjCLaQn1bDvVyXDkg+0xWE2MShH6HP6+gmyQ==
X-Received: by 2002:adf:f60f:0:b0:2cf:f061:4913 with SMTP id t15-20020adff60f000000b002cff0614913mr8730812wrp.49.1679125863626;
        Sat, 18 Mar 2023 00:51:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m8-20020a5d4a08000000b002c3f03d8851sm3699880wrq.16.2023.03.18.00.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:51:03 -0700 (PDT)
Date: Sat, 18 Mar 2023 10:51:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Replace "<<" with BIT macro
Message-ID: <6d78fc9c-59e2-4748-b6a8-65c937b111a2@kili.mountain>
References: <ZBVhmU+5dVoExIH9@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBVhmU+5dVoExIH9@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>

On Sat, Mar 18, 2023 at 12:30:41PM +0530, Abhirup Deb wrote:
> -#define TSI148_PCFS_STAT_SELTIM        (3<<9)	/* DELSEL Timing */
> +#define TSI148_PCFS_STAT_SELTIM        BIT(9)	/* DELSEL Timing */

This patch is buggy.

regards,
dan carpenter
