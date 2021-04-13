Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BA871
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 19:50:06 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso9553662pjb.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 12:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=d5JQs8Tx+1jZkGxhLa1z0jf/2TQov6WAQJIdCWJLtFk=;
        b=QO5ZH0XWGCAtSnFQasOblaMQqYmA7DsyCoftBXbx1i3qQ263FErvWqdiQuSnH2EOKP
         PEe6WigtGLK5Az5GBaaABOIj3PBGmfUoePMX/7fhc4A1B9nEJHRCXe0EpX1X3TMf2zYy
         dw1idnzkClh6WfP874wu34eSBc/wNP10brzFHT46QNjjG8iiTV2s4e2kyt+bPj8HqxWA
         RBmxmwQ1yCa232XdNRcsdjjJfCf4Ce45obhz0nu2AboimowAiPseA3sQwS2h7L0OEtg5
         ydM7A4DZgH6mhkA/72zbW8trxYbj22pxI6GFkWMDiub5jnp0PGMK/63HtvO/NfCuVTqC
         vWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=d5JQs8Tx+1jZkGxhLa1z0jf/2TQov6WAQJIdCWJLtFk=;
        b=ah2jDT9nLwX7fuTSsWVC0waXmoeDKuXyb8oEseIdm3/+z56738akC90iI1bbdH7ePj
         rzbRQlrTOavVF69FUXW4OrBj2jLJ1tPJtXetieZyPOt+ilQ7H3LlT4jd9ARmeyUmD903
         MpeJr15N9qazma42omfcPaGyo1ptyI2mloHcGCcxm8ARj33kgFTUCvtzpw/xXslhyiTZ
         Ss7gf45uXNaH9FRe/s9Qyc/yE3rzEfKJWrbrOu+3w5aTuaeqIF+pkl/bleNnsmPoHdRi
         5Sg6EynGngpDrMjAEaE0DDrS9GP6Mqsu2I+ACbCustTJfmp8K9PIALDXVaCgKZ6XGC59
         dZhQ==
X-Gm-Message-State: AOAM530FMcqL0ltc+DbcrwkqDPnQ5QilsO386E/QFAE2oEu1gxCXtfbG
	xfGNkU1fdkFn/jcjgAQ6j4E=
X-Google-Smtp-Source: ABdhPJxuSnZlMUujv5nFXikHkfCpYArxNbEnXKfglBq+r/hSMy4kBhKWI/uRxNZ6Ezk5qMrnYYQyyg==
X-Received: by 2002:a17:90a:7f8b:: with SMTP id m11mr1631827pjl.221.1618343405874;
        Tue, 13 Apr 2021 12:50:05 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id c1sm13350924pfi.142.2021.04.13.12.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:50:05 -0700 (PDT)
Date: Wed, 14 Apr 2021 01:20:00 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v4 0/2] staging: media: zoran: Cleanup patchset for style
 issues in zr36057.h 
Message-ID: <cover.1618342050.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes from v3:- Rebased these patches and made changes against
mainline code.

Changes from v2:-
[PATCH 1/2]:- No changes.
[PATCH 2/2]:- Aligned the code using tabs.

Changes from v1:- 
[PATCH 1/2]:- No changes.
[PATCH 2/2]:- Aligned the code using tabs and readjusted the
comments line.

Mitali Borkar (2):
  staging: media: zoran: add spaces around '<<' operator
  staging: media: zoran: add BIT() macro and align code

 drivers/staging/media/zoran/zr36057.h | 312 ++++++++++++++------------
 1 file changed, 172 insertions(+), 140 deletions(-)

-- 
2.30.2

