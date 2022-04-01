Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A587C;
	Fri,  1 Apr 2022 19:28:48 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id b189so2902348qkf.11;
        Fri, 01 Apr 2022 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHudlMOg6jYguBQ34zTnQT806trua03XNCZ7WUQx1wE=;
        b=ZfACbjdXfGyVT3TF7t51D8Rpm/gB4pRB+G8lva/IEekE65/lmPgPh4+V0I20mVexv+
         z/AmRY3n2uyuf4NAce/eDYNs/LcyG2KK2gduukJE4aKndOt6bx95U6hTp9qU9Ku6lDtP
         felAYSzkxqvaIGkKS5cqeJJwvIamfWJD0aPBKzvXzmOnOIrggtgPx/iEQCVOHRBzTyMQ
         PY4OyOrcYJWrGhuwZnDzvI80BZsVQaeQnvpOVzqFOmAgXVqeKP5MugOB0VMvj16NH2AM
         4kmbNGnXiV3lFMJc3ArrfzQ3Ok3iU22CUS3TMN2r83bnaTdf5eip++FiGPoUzRJmwKSe
         sTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHudlMOg6jYguBQ34zTnQT806trua03XNCZ7WUQx1wE=;
        b=ipHtoxF3Slh7MZExweElEcChfvvRNNQTMjNMb10o1m5k504ZprhPh4RrztgPFmB0o1
         icgCzinBG/Goef6/+BBxnjF3sROtteQiZp8J48jM63ASHFLwoXBtuWP8m0+VHr191cn5
         aWW/2g2ZnoQQDm4VDcA9VTQ8pPPENO9eq0fp33iRgfl39/Yxgo+ZFr07bDGFsm4gNOoo
         MMVhlw6ZhkhKAUG4Cf4DkyNu4A2AUZdEB2SFvQ338i5B+WCt03+OMDCq1MA9UfY9zwzh
         C4ITh/qFIzMHnB/hbLFBdcvdIGSY9Ks6JwJ8IqQhk9OiZURLOCnN4d42HnupVUpaJ4js
         KemQ==
X-Gm-Message-State: AOAM532qnDEhtfKT8GTxHabna3+L5On4lbBxrb3VPOQo7IzioZ4fafEp
	LlQGWjYURlk/bUrUxyYhCE4=
X-Google-Smtp-Source: ABdhPJyHrJFhTLvc16ABbcfM0ueAJAmhHaDIKPxBGPTLnmDMA8IF0B573/tJaIjF/+u7OvgjFeRpeQ==
X-Received: by 2002:a05:620a:484:b0:67e:16fe:3689 with SMTP id 4-20020a05620a048400b0067e16fe3689mr7332513qkr.745.1648841327493;
        Fri, 01 Apr 2022 12:28:47 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id b21-20020a05620a04f500b0067b4895472esm1792938qkh.5.2022.04.01.12.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 12:28:46 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH v3 0/3] rlt8723bs cleanup
Date: Fri,  1 Apr 2022 15:28:35 -0400
Message-Id: <cover.1648840991.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix three categories of checkpatch warnings (redundant
braces, redundant else branches after return/break, and constant
placements on tests) in file rtw_mlme_ext.c, which is part of the
rtl8723bs driver. False positives, such as

if (foo) {
	/* TODO: ... */
}

were not altered.

---
v1 -> v2: Removing a redundant else branch left a variable declaration
mixed with code, which was caught by the kernel test bot. Move the
declaration to the beginning of a function.

v3 -> v2: Include correct files in the patchset.
---

Sevinj Aghayeva (3):
  staging: rtl8723bs: remove redundant braces in if statements
  staging: rtl8723bs: place constants on the right side of tests
  staging: rtl8723bs: remove redundant else branches

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 167 ++++++++----------
 1 file changed, 70 insertions(+), 97 deletions(-)

-- 
2.25.1

