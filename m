Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C636D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:34:54 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso929301pje.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 01:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YodPf4w+KP/KQ4oZ3/LgaJa6DCkCE0zYteoLQ1Kua0g=;
        b=QBWshRauOJwgPJ/1WSSMGkpI9QUBneDOZC7IT+yKf8MUVVOZ8bLbSPK2tt4GgwW3qS
         0G8+X3xoYIN1DEHn7oBtMs7flKkeXCvCA/c9oyw7nBa0esmhLHeB5lQx1DEDuW+18AWk
         Mga2n1ByiqVLBZfgzaqIuxHhjr71J7O8FLx0PZLCCwCqebsVOzgJ4d/kJHsikU4G/ygH
         LNhN9q7bufv2Lg+R1AWkzJZvgTcuGYC+rCEIV7zNPsCaWIFINuF8n9mCPR1hTwLWaWSA
         AvzeDmqRD9katToesSc9U04/GWI15ely7ghkMrChmfPB8OLss8jRcFVdulCYjEb3d/yg
         1lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YodPf4w+KP/KQ4oZ3/LgaJa6DCkCE0zYteoLQ1Kua0g=;
        b=CIluGByaocngdLX/8jLe3hBgevkd+HWKRZ3GPr4tgYWlm1U/yGdlwo6vMwr5Ya7uxe
         HNCl72yMRo3cnEMW/N5lK5gGrugCyvs58AFQNxcmOBJP2fzK0RlFxPBu7P8ilr/cLqPN
         zoKjb5qx/6GJG4tO5+ePf+KjWv3HGFxK+c86slGqCjVkTzHKoF06f+LMR7crDfiVYgrj
         Qjl7JsM/ZTqYLMTKLFyIdZppcNYiNoR7SgPLRpBaH5yjpakyQUrrlcz4IWjJ5OsxIEEe
         Y5UP6SAkWAnOcpCKU3qlUeCefkkIU/2YKlrCfoJbKUpt5prLTJMOeSdXlXtx/RTyC/XI
         yLMg==
X-Gm-Message-State: AOAM533HrA0rVR5LkS6PBU+tkixBkIFhP6KzauOZAXZ8sEhpfiR8r8Oj
	rnOC8CQdo7G0xCVdOoUZJncGcde4P+dG5g==
X-Google-Smtp-Source: ABdhPJx/8yajvSzwzQYCAcss3C7s5sz7i+WWOprBuqLzkR87htJxJpgbrzlHfZbayd/IEqZwpJ8Prw==
X-Received: by 2002:a17:902:e752:b029:e9:5e60:b866 with SMTP id p18-20020a170902e752b02900e95e60b866mr2125037plf.55.1617784493988;
        Wed, 07 Apr 2021 01:34:53 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id r22sm22531858pgu.81.2021.04.07.01.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 01:34:53 -0700 (PDT)
Date: Wed, 7 Apr 2021 01:34:51 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/49] *** SUBJECT HERE ***
Message-ID: <YG1uq8knhKQsQGU+@localhost.localdomain>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
 <20210407071117.GA1354@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407071117.GA1354@agape.jhs>

On Wed, Apr 07, 2021 at 09:11:18AM +0200, Fabio Aiuto wrote:
> On Tue, Apr 06, 2021 at 11:35:54PM -0700, Pavle Rohalj wrote:
> > Changes in v2:
> >     - Removed type information from variable names
> >     - Broken up the changes into smaller patches
> 
> Hi Pavle,
> 
> I think you missed the subject in cover letter, but maybe
> is not a relevant issue...

(Resending this because I realized I did not reply to everyone)

Hi Fabio,

I did, my bad. This patchset is an attempt to fix checkpatch.pl checks
for camel case usage in sm750fb driver.

-Pavle
