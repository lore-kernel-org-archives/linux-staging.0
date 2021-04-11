Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0C172
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:28 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MHo6Y-1lIx053s62-00EtJk; Sun, 11 Apr 2021 20:12:24 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 03/10] staging: vchiq_core: Get the rid off curly braces around cases
Date: Sun, 11 Apr 2021 20:11:33 +0200
Message-Id: <1618164700-21150-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:hmgfkkjyBLFfH2TrwPGCJN9pQhizaMccClEhfF0Rv9jT4mRuekf
 4apvKCS796LX0o3T1ErkxVYvrQlGOZUXMl30VV1u7WE5iubzPIwDc4n//G9PwlcPZyDG+uI
 WLsLvKjc28AngnvuObjalbFXwW/SU1YRfHTmIG15BExv8i+HL2EbYC41hvKbta733WoOeUb
 dqStV0XAjc8jllDZG+zKg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pwYi7k5JPk4=:IEHS6eGpvI6ljpHnw95C4d
 DQujeUlFZ7ZgMxv3cbC8NVL4ZkZ54Ulm3qGHhnDzjcCKfh0oHj3576Qk05m4pzigDe/AZ2De0
 oYnRRqRcgj1UUBotzJFAhbot2hH6P0iv7gHrjsg1LPO56zkb/mxVYZF68hokPQaqREwNA6MB1
 AQV8N00yZS4jsQRLKkVpSmWwaJyKkiDBwq6aUhbhxn3R+Tym23rgHggblHYOmPih7oU/aVgOq
 yu42rSPgfIDbLCVNJ7wXxHscYZWiq29r4fXK8QDkQ4JMLRDmvwlW+lHLm+XaesznQWtuLB3PJ
 DtDIfT0htySfCka9MSzYDQ5vnj2nWwwRU4ib1DU0uCxBnGJgUVoXmzL1mAiIr0BmQMlN8q17o
 QiMn8vKofpCMhiwSv+H6/YYqW5m/A2zdEoKk/tHd350E0FnMS94igc7Epki00uSOeJMVg4yDu
 dcEcLIaodlByJONYJFLz04e61XOkHlnyu4/aD8WgIRA+J5vlh96q
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Additional curly braces around cases are a bit harder to read. So
change the scope of service quota to get the rid off those braces.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c        | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 5428140..835f2a5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3357,6 +3357,7 @@ vchiq_set_service_option(unsigned int handle,
 {
 	struct vchiq_service *service = find_service_by_handle(handle);
 	enum vchiq_status status = VCHIQ_ERROR;
+	struct vchiq_service_quota *quota;
 
 	if (service) {
 		switch (option) {
@@ -3365,9 +3366,8 @@ vchiq_set_service_option(unsigned int handle,
 			status = VCHIQ_SUCCESS;
 			break;
 
-		case VCHIQ_SERVICE_OPTION_SLOT_QUOTA: {
-			struct vchiq_service_quota *quota =
-				&service->state->service_quotas[
+		case VCHIQ_SERVICE_OPTION_SLOT_QUOTA:
+			quota = &service->state->service_quotas[
 					service->localport];
 			if (value == 0)
 				value = service->state->default_slot_quota;
@@ -3385,11 +3385,10 @@ vchiq_set_service_option(unsigned int handle,
 				}
 				status = VCHIQ_SUCCESS;
 			}
-		} break;
+			break;
 
-		case VCHIQ_SERVICE_OPTION_MESSAGE_QUOTA: {
-			struct vchiq_service_quota *quota =
-				&service->state->service_quotas[
+		case VCHIQ_SERVICE_OPTION_MESSAGE_QUOTA:
+			quota = &service->state->service_quotas[
 					service->localport];
 			if (value == 0)
 				value = service->state->default_message_quota;
@@ -3407,7 +3406,7 @@ vchiq_set_service_option(unsigned int handle,
 					complete(&quota->quota_event);
 				status = VCHIQ_SUCCESS;
 			}
-		} break;
+			break;
 
 		case VCHIQ_SERVICE_OPTION_SYNCHRONOUS:
 			if ((service->srvstate == VCHIQ_SRVSTATE_HIDDEN) ||
-- 
2.7.4

